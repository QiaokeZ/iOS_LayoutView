//
//  LinearLayoutView.swift
//  LinearLayoutView <https://github.com/QiaokeZ/iOS_Swift_LayoutView>
//
//  Created by admin on 2019/1/18.
//  Copyright © 2019 zhouqiao. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

import UIKit

enum LinearLayoutDirection: Int {
    case vertical
    case horizontal
}

enum LinearLayoutContentGravity {
    case none
    case top
    case left
    case bottom
    case right
    case center
    case centerHorizontal
    case centerVertical
}

class LinearLayoutView: UIView {

    private(set) var direction: LinearLayoutDirection = .horizontal
    private(set) var contentGravity: LinearLayoutContentGravity = .none

    private override init(frame: CGRect) {
        super.init(frame: .zero)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    init(direction: LinearLayoutDirection = .horizontal, contentGravity: LinearLayoutContentGravity = .none, width: LayoutSize = .fill, height: LayoutSize = .fill) {
        super.init(frame: .zero)
        self.direction = direction
        self.contentGravity = contentGravity
        self.lv.width = width
        self.lv.height = height
    }

    public func layout() {
        setSubViewsSize()
        setSelfFrame()
        setSubViewsOrigin()
    }
}

extension LinearLayoutView {

    private func setSubViewsSize() {
        let selfSize = CGSize(width: getViewWidth(self), height: getViewHeight(self))
        let totalWeight = subviews.reduce(CGFloat(0)) { (value, view) in
            view.frame = .zero
            return value + view.lv.weight
        }
        let marginSize = subviews.reduce(CGSize.zero) { (value, view) in
            if view.lv.weight > 0 {
                return CGSize(width: value.width + (view.lv.margin * 2 + view.lv.marginLeft + view.lv.marginRight),
                    height: value.height + (view.lv.margin * 2 + view.lv.marginTop + view.lv.marginBottom))
            } else {
                return CGSize(width: value.width + getViewWidth(view) + (view.lv.margin * 2 + view.lv.marginLeft + view.lv.marginRight),
                    height: value.height + getViewHeight(view) + (view.lv.margin * 2 + view.lv.marginTop + view.lv.marginBottom))
            }
        }
        for view in subviews {
            view.frame.size = CGSize(width: ceil(getViewWidth(view)), height: ceil(getViewHeight(view)))
            if view.lv.weight > 0 {
                switch direction {
                case .horizontal:
                    view.frame.size.width = ceil(max((view.lv.weight * (selfSize.width - marginSize.width) / totalWeight), 0))
                    view.lv.width = .pt(view.frame.size.width)
                case .vertical:
                    view.frame.size.height = ceil(max((view.lv.weight * (selfSize.height - marginSize.height) / totalWeight), 0))
                    view.lv.height = .pt(view.frame.size.height)
                }
            }
            if let layoutView = view as? LinearLayoutView {
                layoutView.layout()
            } else if let layoutView = view as? RelativeLayoutView {
                layoutView.layout()
            } else if let layoutView = view as? FlowLayoutView {
                layoutView.layout()
            }
        }
    }

    private func setSelfFrame() {
        frame.origin = CGPoint(x: lv.margin + lv.marginLeft, y: lv.margin + lv.marginTop)
        frame.size = CGSize(width: ceil(getViewWidth(self)), height: ceil(getViewHeight(self)))
    }

    private func setSubViewsOrigin() {
        var lastView: UIView?
        for view in subviews {
            var size = CGSize.zero
            if let value = lastView {
                size = CGSize(width: value.frame.maxX + value.lv.margin + value.lv.marginRight, height: value.frame.maxY + value.lv.margin + value.lv.marginBottom)
            }
            switch direction {
            case .horizontal:
                view.frame.origin.x = view.lv.margin + view.lv.marginLeft + size.width
                switch contentGravity {
                case .centerVertical, .center:
                    view.frame.origin.y = ((frame.height - view.frame.height) / 2) + (view.lv.marginTop - view.lv.marginBottom)
                case .centerHorizontal:
                    view.frame.origin.x = ((frame.width - view.frame.width) / 2) + (view.lv.marginLeft - view.lv.marginRight)
                case .bottom:
                    view.frame.origin.y = frame.height - view.frame.height - view.lv.margin - view.lv.marginBottom
                default:
                    view.frame.origin.y = view.lv.margin + view.lv.marginTop
                    break
                }
                switch view.lv.gravity {
                case .center, .centerVertical:
                    view.frame.origin.y = ((frame.height - view.frame.height) / 2) + (view.lv.marginTop - view.lv.marginBottom)
                case .centerHorizontal:
                    view.frame.origin.x = (frame.width - view.frame.width) / 2
                case .bottom:
                    view.frame.origin.y = frame.height - view.frame.height - view.lv.margin - view.lv.marginBottom
                case .top:
                    view.frame.origin.y = view.lv.margin + view.lv.marginTop
                default:
                    break
                }
            case .vertical:
                view.frame.origin.y = view.lv.margin + view.lv.marginTop + size.height
                switch contentGravity {
                case .centerHorizontal, .center:
                    view.frame.origin.x = ((frame.width - view.frame.width) / 2) + (view.lv.marginLeft - view.lv.marginRight)
                case .centerVertical:
                    view.frame.origin.y = ((frame.height - view.frame.height) / 2) + (view.lv.marginTop - view.lv.marginBottom)
                case .right:
                    view.frame.origin.x = frame.width - view.frame.width - view.lv.margin - view.lv.marginRight
                default:
                    view.frame.origin.x = view.lv.margin + view.lv.marginLeft
                    break
                }
                switch view.lv.gravity {
                case .center, .centerHorizontal:
                    view.frame.origin.x = ((frame.width - view.frame.width) / 2) + (view.lv.marginLeft - view.lv.marginRight)
                case .centerVertical:
                    view.frame.origin.y = (frame.height - view.frame.height) / 2
                case .right:
                    view.frame.origin.x = frame.width - view.frame.width - view.lv.margin - view.lv.marginRight
                case .left:
                    view.frame.origin.x = view.lv.margin + view.lv.marginLeft
                default:
                    break
                }
            }
            lastView = view
        }
        let totalSize = getSubViewsTotalSize(self)
        for view in subviews {
            switch direction {
            case .horizontal:
                if contentGravity == .center {
                    view.frame.origin.x = view.frame.origin.x + (frame.width - totalSize.width) / 2
                }
            case .vertical:
                if contentGravity == .center {
                    view.frame.origin.y = view.frame.origin.y + (frame.height - totalSize.height) / 2
                }
            }
        }
    }

    private func getViewWidth(_ from: UIView) -> CGFloat {
        var width = from.frame.width
        switch from.lv.width {
        case .fill:
            if let view = from.superview {
                width = view.frame.width - from.lv.margin * 2 - from.lv.marginLeft - from.lv.marginRight
                if view is LinearLayoutView || view is RelativeLayoutView || view is FlowLayoutView {
                    if !isWrap(view.lv.width) {
                        width = getViewWidth(view) - from.lv.margin * 2 - from.lv.marginLeft - from.lv.marginRight
                    }
                }
            }
        case .pt(let value):
            width = value
        case .wrap:
            if let child = from as? LinearLayoutView {
                width = getLayoutWrapViewSize(child).width
            }
        }
        return width
    }

    private func getViewHeight(_ from: UIView) -> CGFloat {
        var height = from.frame.height
        switch from.lv.height {
        case .fill:
            if let view = from.superview {
                height = view.frame.height - from.lv.margin * 2 - from.lv.marginTop - from.lv.marginBottom
                if view is LinearLayoutView || view is RelativeLayoutView || view is FlowLayoutView {
                    if !isWrap(view.lv.height) {
                        height = getViewHeight(view) - from.lv.margin * 2 - from.lv.marginTop - from.lv.marginBottom
                    }
                }
            }
        case .pt(let value):
            height = value
        case .wrap:
            if let child = from as? LinearLayoutView {
                height = getLayoutWrapViewSize(child).height
            }
        }
        return height
    }

    private func getLayoutWrapViewSize(_ from: LinearLayoutView) -> CGSize {
        var size = CGSize.zero
        for view in from.subviews {
            switch from.direction {
            case .horizontal:
                size.width += getViewWidth(view) + view.lv.margin * 2 + view.lv.marginLeft + view.lv.marginRight
                let height = getViewHeight(view) + view.lv.margin * 2 + view.lv.marginTop + view.lv.marginBottom
                if height > size.height {
                    size.height = height
                }
            case .vertical:
                size.height += getViewHeight(view) + view.lv.margin * 2 + view.lv.marginTop + view.lv.marginBottom
                let width = getViewWidth(view) + view.lv.margin * 2 + view.lv.marginLeft + view.lv.marginRight
                if width > size.width {
                    size.width = width
                }
            }
        }
        return size
    }

    private func getSubViewsTotalSize(_ from: LinearLayoutView) -> CGSize {
        var size = CGSize.zero
        for view in from.subviews {
            switch from.direction {
            case .horizontal:
                size.width += view.frame.width + view.lv.margin * 2 + view.lv.marginLeft + view.lv.marginRight
                size.height = view.frame.maxY + view.lv.margin + view.lv.marginBottom
            case .vertical:
                size.height += view.frame.height + view.lv.margin * 2 + view.lv.marginTop + view.lv.marginBottom
                size.width = view.frame.maxX + view.lv.margin + view.lv.marginRight
            }
        }
        return size
    }

    private func isWrap(_ size: LayoutSize) -> Bool {
        switch size {
        case .fill:
            return false
        case .wrap:
            return true
        case .pt(_):
            return false
        }
    }
}
