

import UIKit

class RelativeLayoutView: UIView {

    private override init(frame: CGRect) {
        super.init(frame: .zero)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(width: LayoutSize = .fill, height: LayoutSize = .fill) {
        super.init(frame: .zero)
        self.width = width
        self.height = height
    }

    override func willMove(toWindow newWindow: UIWindow?) {
        super.didMoveToWindow()
        if frame == .zero {
            layoutRelativeView(self)
        }
    }

    override func layoutIfNeeded() {
        layoutRelativeView(self)
    }
}

extension RelativeLayoutView {

    private func layoutRelativeView(_ from: RelativeLayoutView) {
        setChildViewSize(from)
        setChildViewOrigin(from)
        setLayoutViewFrame(from)
    }

    private func setChildViewSize(_ from: RelativeLayoutView) {
        for view in from.subviews {
            view.frame = .zero
            if view is LinearLayoutView || view is RelativeLayoutView {
                view.layoutIfNeeded()
            } else {
                view.frame.size = getViewSize(view)
            }
        }
    }

    private func setChildViewOrigin(_ from: RelativeLayoutView) {
        let parentSize = getViewSize(from)
        for view in from.subviews {
            view.frame.origin = CGPoint(x: view.margin + view.marginLeft, y: view.margin + view.marginTop)
            if let toTopView = view.toTopOf {
                view.frame.origin.y = toTopView.frame.origin.y - toTopView.margin - toTopView.marginTop - (view.frame.height + view.margin + view.marginBottom)
            }
            if let toLeftView = view.toLeftOf {
                view.frame.origin.x = toLeftView.frame.origin.x - toLeftView.margin - toLeftView.marginLeft - (view.frame.width + view.margin + view.marginRight)
            }
            if let toBottomView = view.toBottomOf {
                view.frame.origin.y = toBottomView.frame.maxY + toBottomView.margin + toBottomView.marginBottom + view.margin + view.marginBottom
            }
            if let toRightView = view.toRightOf {
                view.frame.origin.x = toRightView.frame.maxX + toRightView.margin + toRightView.marginRight + view.margin + view.marginLeft
            }
            if let alignTopView = view.alignTop {
                view.frame.origin.y = alignTopView.frame.origin.y + view.margin + view.marginTop
            }
            if let alignLeftView = view.alignLeft {
                view.frame.origin.x = alignLeftView.frame.origin.x + view.margin + view.marginLeft
            }
            if let alignBottomView = view.alignBottom {
                view.frame.origin.y = alignBottomView.frame.maxY - (view.frame.height + view.margin + view.marginBottom)
            }
            if let alignRightView = view.alignRight {
                view.frame.origin.x = alignRightView.frame.maxX - (view.frame.width + view.margin + view.marginLeft)
            }
            if view.alignParent.contains(.top) {
                view.frame.origin.y = view.margin + view.marginTop
            }
            if view.alignParent.contains(.left) {
                view.frame.origin.x = view.margin + view.marginLeft
            }
            if view.alignParent.contains(.bottom) {
                view.frame.origin.y = parentSize.height - (view.frame.height + view.margin + view.marginBottom)
            }
            if view.alignParent.contains(.right) {
                view.frame.origin.x = parentSize.width - (view.frame.width + view.margin + view.marginRight)
            }
            if view.gravity == .center {
                view.frame.origin = CGPoint(x: (parentSize.width - view.frame.width) / 2, y: (parentSize.height - view.frame.height) / 2)
            }
            if view.gravity == .centerHorizontal {
                view.frame.origin.x = ((parentSize.width - view.frame.width) / 2) + (view.marginLeft - view.marginRight)
            }
            if view.gravity == .centerVertical {
                view.frame.origin.y = ((parentSize.height - view.frame.height) / 2) + (view.marginTop - view.marginBottom)
            }
        }
    }

    private func setLayoutViewFrame(_ from: RelativeLayoutView) {
        if from.frame.origin == .zero {
            from.frame.origin = CGPoint(x: from.margin + from.marginLeft, y: from.margin + from.marginTop)
        }
        if from.frame.size.width == 0 {
            switch from.width {
            case .fill:
                if let value = from.superview {
                    from.frame.size.width = value.frame.width - from.margin * 2 - from.marginLeft - from.marginRight
                }
            case .wrap:
                from.frame.size.width = from.subviews.map { $0.frame.maxX + $0.margin + $0.marginLeft }.max() ?? 0
            case .px(let value):
                from.frame.size.width = value
            }
        }
        if from.frame.size.height == 0 {
            switch from.height {
            case .fill:
                if let value = from.superview {
                    from.frame.size.height = value.frame.height - from.margin * 2 - from.marginTop - from.marginBottom
                }
            case .wrap:
                from.frame.size.height = from.subviews.map { $0.frame.maxX + $0.margin + $0.marginBottom }.max() ?? 0
            case .px(let value):
                from.frame.size.height = value
            }
        }
    }

    private func getViewSize(_ from: UIView) -> CGSize {
        var size = from.frame.size
        if size.width == 0 {
            switch from.width {
            case .fill:
                if let value = from.superview {
                    size.width = value.frame.size.width - from.margin * 2 - from.marginLeft - from.marginRight
                    if value is RelativeLayoutView {
                        size.width = getViewSize(value).width - from.margin * 2 - from.marginLeft - from.marginRight
                    }
                }
            case .px(let value):
                size.width = value
            case .wrap:
                break
            }
        }
        if size.height == 0 {
            switch from.height {
            case .fill:
                if from.frame.height == 0, let value = from.superview {
                    size.height = value.frame.size.height - from.margin * 2 - from.marginTop - from.marginBottom
                    if value is RelativeLayoutView {
                        size.height = getViewSize(value).height - from.margin * 2 - from.marginTop - from.marginBottom
                    }
                }
            case .px(let value):
                size.height = value
            case .wrap:
                break
            }
        }
        return size
    }
}
