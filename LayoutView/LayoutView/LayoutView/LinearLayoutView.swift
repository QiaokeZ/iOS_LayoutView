

import UIKit

enum LinearDirection: Int {
    case vertical
    case horizontal
}

class LinearLayoutView: UIView {

    private(set) var direction: LinearDirection = .horizontal

    private override init(frame: CGRect) {
        super.init(frame: .zero)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(direction: LinearDirection = .horizontal, gravity: LayoutGravity = .none, width: LayoutSize = .fill, height: LayoutSize = .fill) {
        super.init(frame: .zero)
        self.direction = direction
        self.gravity = gravity
        self.width = width
        self.height = height
    }

    override func willMove(toWindow newWindow: UIWindow?) {
        super.didMoveToWindow()
        if frame == .zero {
            layoutLinearView(self)
        }
    }

    override func layoutIfNeeded() {
        layoutLinearView(self)
    }
}

extension LinearLayoutView {

    private func layoutLinearView(_ from: LinearLayoutView) {
        setChildViewSize(from)
        setLayoutViewFrame(from)
        setChildViewOrigin(from)
    }

    private func setChildViewSize(_ from: LinearLayoutView) {
        let totalSize = CGSize(width: getChildViewWidth(from), height: getChildViewHeight(from))
        let totalWeight = from.subviews.reduce(CGFloat(0)) { (value, view) in
            view.frame = CGRect.zero
            return value + view.weight
        }
        let surplusSize = from.subviews.reduce(CGSize.zero) { (value, view) in
            if view.weight > 0 {
                return CGSize(width: value.width + (view.margin * 2 + view.marginLeft + view.marginRight),
                    height: value.height + (view.margin * 2 + view.marginTop + view.marginBottom))
            } else {
                return CGSize(width: value.width + getChildViewWidth(view) + (view.margin * 2 + view.marginLeft + view.marginRight),
                    height: value.height + getChildViewHeight(view) + (view.margin * 2 + view.marginTop + view.marginBottom))
            }
        }
        for view in from.subviews {
            view.frame.size = CGSize(width: getChildViewWidth(view), height: getChildViewHeight(view))
            if view.weight > 0 {
                if from.direction == .horizontal {
                    view.frame.size.width = max((view.weight * (totalSize.width - surplusSize.width) / totalWeight), 0)
                } else {
                    view.frame.size.height = max((view.weight * (totalSize.height - surplusSize.height) / totalWeight), 0)
                }
            }
            if view is LinearLayoutView || view is RelativeLayoutView {
                view.layoutIfNeeded()
            }
        }
    }

    private func setLayoutViewFrame(_ from: LinearLayoutView) {
        from.frame.size = CGSize(width: getChildViewWidth(from), height: getChildViewHeight(from))
        if from.frame.origin == .zero {
            from.frame.origin = CGPoint(x: from.margin + from.marginLeft, y: from.margin + from.marginTop)
        }
    }

    private func setChildViewOrigin(_ from: LinearLayoutView) {
        var lastView: UIView?
        for view in from.subviews {
            var size = CGSize.zero
            if let value = lastView {
                size = CGSize(width: value.frame.maxX + value.margin + value.marginRight, height: value.frame.maxY + value.margin + value.marginBottom)
            }
            if from.direction == .horizontal {
                view.frame.origin = CGPoint(x: view.margin + view.marginLeft + size.width, y: view.margin + view.marginTop)
                if view.gravity == .center {
                    if from.frame.height > view.frame.height {
                        view.frame.origin.y = (from.frame.height - view.frame.height) / 2
                    }
                } else if view.gravity == .bottom {
                    if from.frame.height > view.frame.height + view.margin + view.marginBottom {
                        view.frame.origin.y = from.frame.height - view.frame.height - view.margin - view.marginBottom
                    }
                }
            } else {
                view.frame.origin = CGPoint(x: view.margin + view.marginLeft, y: view.margin + view.marginTop + size.height)
                if view.gravity == .center {
                    if from.frame.width > view.frame.width {
                        view.frame.origin.x = (from.frame.width - view.frame.width) / 2
                    }
                } else if view.gravity == .right {
                    if from.frame.width > view.frame.width + view.margin + view.marginRight {
                        view.frame.origin.x = from.frame.width - view.frame.width - view.margin - view.marginRight
                    }
                }
            }
            lastView = view
        }
        let childTotalSize = getViewChildTotalSize(from)
        for view in from.subviews {
            if from.direction == .horizontal {
                let match = view.gravity != .top && view.gravity != .center && view.gravity != .bottom
                switch from.gravity {
                case .center:
                    if match {
                        view.frame.origin.y = (from.frame.height - view.frame.height) / 2
                    }
                    view.frame.origin.x = view.frame.origin.x + (from.frame.width - childTotalSize.width) / 2
                case .centerHorizontal:
                    view.frame.origin.x = view.frame.origin.x + (from.frame.width - childTotalSize.width) / 2
                case .centerVertical:
                    if match {
                        view.frame.origin.y = (from.frame.height - view.frame.height) / 2
                    }
                case .bottom:
                    if match {
                        view.frame.origin.y = from.frame.height - view.frame.height - view.margin - view.marginBottom
                    }
                default:
                    break
                }
            } else {
                let match = view.gravity != .left && view.gravity != .center && view.gravity != .right
                switch from.gravity {
                case .center:
                    if match {
                        view.frame.origin.x = (from.frame.width - view.frame.width) / 2
                    }
                    view.frame.origin.y = view.frame.origin.y + (from.frame.height - childTotalSize.height) / 2
                case .centerVertical:
                    view.frame.origin.y = view.frame.origin.y + (from.frame.height - childTotalSize.height) / 2
                case .centerHorizontal:
                    if match {
                        view.frame.origin.x = (from.frame.width - view.frame.width) / 2
                    }
                case .right:
                    if match {
                        view.frame.origin.x = from.frame.width - view.frame.width - view.margin - view.marginRight
                    }
                default:
                    break
                }
            }
        }
    }

    private func getChildViewWidth(_ from: UIView) -> CGFloat {
        var width = from.frame.width
        if width == 0 {
            switch from.width {
            case .fill:
                if let value = from.superview {
                    width = value.frame.width - from.margin * 2 - from.marginLeft - from.marginRight
                    if value is LinearLayoutView || value is RelativeLayoutView {
                        width = getChildViewWidth(value) - from.margin * 2 - from.marginLeft - from.marginRight
                        if let child = value as? LinearLayoutView {
                            if child.direction == .horizontal {
                                for view in child.subviews {
                                    if view == from {
                                        break
                                    }
                                    width -= view.frame.width + view.margin * 2 + view.marginLeft + view.marginRight
                                }
                            }
                        }
                    }
                }
            case .px(let value):
                width = value
            case .wrap:
                if let child = from as? LinearLayoutView {
                    width = getLayoutWrapViewSize(child).width
                }
            }
        }
        return width
    }

    private func getChildViewHeight(_ from: UIView) -> CGFloat {
        var height = from.frame.height
        if height == 0 {
            switch from.height {
            case .fill:
                if let value = from.superview {
                    height = value.frame.height - from.margin * 2 - from.marginTop - from.marginBottom
                    if value is LinearLayoutView || value is RelativeLayoutView {
                        height = getChildViewHeight(value) - from.margin * 2 - from.marginTop - from.marginBottom
                        if let child = value as? LinearLayoutView {
                            if child.direction == .vertical {
                                for view in child.subviews {
                                    if view == from {
                                        break
                                    }
                                    height -= view.frame.height + view.margin * 2 + view.marginTop + view.marginBottom
                                }
                            }
                        }
                    }
                }
            case .px(let value):
                height = value
            case .wrap:
                if let child = from as? LinearLayoutView {
                    height = getLayoutWrapViewSize(child).height
                }
            }
        }
        return height
    }

    private func getLayoutWrapViewSize(_ from: LinearLayoutView) -> CGSize {
        var size = CGSize.zero
        for view in from.subviews {
            if from.direction == .horizontal {
                size.width += getChildViewWidth(view) + view.margin * 2 + view.marginLeft + view.marginRight
                let height = getChildViewHeight(view) + view.margin * 2 + view.marginTop + view.marginBottom
                if height > size.height{
                   size.height = height
                }
            } else {
                size.height += getChildViewHeight(view) + view.margin * 2 + view.marginTop + view.marginBottom
                let width = getChildViewWidth(view) + view.margin * 2 + view.marginLeft + view.marginRight
                if width > size.width{
                    size.width = width
                }
            }
        }
        return size
    }
    
    private func getViewChildTotalSize(_ from: LinearLayoutView) -> CGSize {
        var size = CGSize.zero
        for view in from.subviews {
            if from.direction == .horizontal {
                size.width += view.frame.width + view.margin * 2 + view.marginLeft + view.marginRight
                size.height = view.frame.maxY + view.margin + view.marginBottom
            } else {
                size.height += view.frame.height + view.margin * 2 + view.marginTop + view.marginBottom
                size.width = view.frame.maxX + view.margin + view.marginRight
            }
        }
        return size
    }
}
