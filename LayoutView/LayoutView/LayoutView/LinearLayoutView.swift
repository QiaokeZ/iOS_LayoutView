//
//  LinearLayoutView.swift
//  LinearLayoutView <https://github.com/QiaokeZ/iOS_LayoutView>
//
//  Created by admin on 2019/1/18.
//  Copyright © 2019 zhouqiao. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

import UIKit

class LinearLayoutView: UIView {

    private(set) var direction: LayoutDirection = .horizontal

    private override init(frame: CGRect) {
        super.init(frame: .zero)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(direction: LayoutDirection = .horizontal, gravity: LayoutGravity = .none, width: LayoutSize = .fill, height: LayoutSize = .fill) {
        super.init(frame: .zero)
        self.direction = direction
        self.lv.gravity = gravity
        self.lv.width = width
        self.lv.height = height
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setChildViewSize()
        setLayoutViewFrame()
        setChildViewOrigin()
    }
}

extension LinearLayoutView {

    private func setChildViewSize() {
        let parentSize = CGSize(width: getViewWidth(self), height: getViewHeight(self))
        let totalWeight = subviews.reduce(CGFloat(0)) { (value, view) in
            view.frame = .zero
            return value + view.lv.weight
        }
        let surplusSize = subviews.reduce(CGSize.zero) { (value, view) in
            if view.lv.weight > 0 {
                return CGSize(width: value.width + (view.lv.margin * 2 + view.lv.marginLeft + view.lv.marginRight),
                    height: value.height + (view.lv.margin * 2 + view.lv.marginTop + view.lv.marginBottom))
            } else {
                return CGSize(width: value.width + getViewWidth(view) + (view.lv.margin * 2 + view.lv.marginLeft + view.lv.marginRight),
                    height: value.height + getViewHeight(view) + (view.lv.margin * 2 + view.lv.marginTop + view.lv.marginBottom))
            }
        }
        for view in subviews {
            view.frame.size = CGSize(width: getViewWidth(view), height: getViewHeight(view))
            if view.lv.weight > 0 {
                if direction == .horizontal {
                    view.frame.size.width = max((view.lv.weight * (parentSize.width - surplusSize.width) / totalWeight), 0)
                } else {
                    view.frame.size.height = max((view.lv.weight * (parentSize.height - surplusSize.height) / totalWeight), 0)
                }
            }
        }
    }

    private func setLayoutViewFrame() {
        if frame == .zero {
            frame.size = CGSize(width: getViewWidth(self), height: getViewHeight(self))
            frame.origin = CGPoint(x: lv.margin + lv.marginLeft, y: lv.margin + lv.marginTop)
        }
    }

    private func setChildViewOrigin() {
        var lastView: UIView?
        for view in subviews {
            var size = CGSize.zero
            if let value = lastView {
                size = CGSize(width: value.frame.maxX + value.lv.margin + value.lv.marginRight, height: value.frame.maxY + value.lv.margin + value.lv.marginBottom)
            }
            if direction == .horizontal {
                view.frame.origin = CGPoint(x: view.lv.margin + view.lv.marginLeft + size.width, y: view.lv.margin + view.lv.marginTop)
                if view.lv.gravity == .center {
                    if frame.height > view.frame.height {
                        view.frame.origin.y = (frame.height - view.frame.height) / 2
                    }
                } else if view.lv.gravity == .bottom {
                    if frame.height > view.frame.height + view.lv.margin + view.lv.marginBottom {
                        view.frame.origin.y = frame.height - view.frame.height - view.lv.margin - view.lv.marginBottom
                    }
                }
            } else {
                view.frame.origin = CGPoint(x: view.lv.margin + view.lv.marginLeft, y: view.lv.margin + view.lv.marginTop + size.height)
                if view.lv.gravity == .center {
                    if frame.width > view.frame.width {
                        view.frame.origin.x = (frame.width - view.frame.width) / 2
                    }
                } else if view.lv.gravity == .right {
                    if frame.width > view.frame.width + view.lv.margin + view.lv.marginRight {
                        view.frame.origin.x = frame.width - view.frame.width - view.lv.margin - view.lv.marginRight
                    }
                }
            }
            lastView = view
        }
        let childTotalSize = getViewChildTotalSize(self)
        for view in subviews {
            if direction == .horizontal {
                let match = view.lv.gravity != .top && view.lv.gravity != .center && view.lv.gravity != .bottom
                switch lv.gravity {
                case .center:
                    if match {
                        view.frame.origin.y = (frame.height - view.frame.height) / 2
                    }
                    view.frame.origin.x = view.frame.origin.x + (frame.width - childTotalSize.width) / 2
                case .centerHorizontal:
                    view.frame.origin.x = view.frame.origin.x + (frame.width - childTotalSize.width) / 2
                case .centerVertical:
                    if match {
                        view.frame.origin.y = (frame.height - view.frame.height) / 2
                    }
                case .bottom:
                    if match {
                        view.frame.origin.y = frame.height - view.frame.height - view.lv.margin - view.lv.marginBottom
                    }
                default:
                    break
                }
            } else {
                let match = view.lv.gravity != .left && view.lv.gravity != .center && view.lv.gravity != .right
                switch lv.gravity {
                case .center:
                    if match {
                        view.frame.origin.x = (frame.width - view.frame.width) / 2
                    }
                    view.frame.origin.y = view.frame.origin.y + (frame.height - childTotalSize.height) / 2
                case .centerVertical:
                    view.frame.origin.y = view.frame.origin.y + (frame.height - childTotalSize.height) / 2
                case .centerHorizontal:
                    if match {
                        view.frame.origin.x = (frame.width - view.frame.width) / 2
                    }
                case .right:
                    if match {
                        view.frame.origin.x = frame.width - view.frame.width - view.lv.margin - view.lv.marginRight
                    }
                default:
                    break
                }
            }
        }
    }

    private func getViewWidth(_ from: UIView) -> CGFloat {
        if from.frame.width > 0 {
            return from.frame.width
        } else {
            var width = from.frame.width
            switch from.lv.width {
            case .fill:
                if let value = from.superview {
                    width = value.frame.width - from.lv.margin * 2 - from.lv.marginLeft - from.lv.marginRight
                    if value is LinearLayoutView || value is RelativeLayoutView || value is FlowLayoutView {
                        width = getViewWidth(value) - from.lv.margin * 2 - from.lv.marginLeft - from.lv.marginRight
                        if let child = value as? LinearLayoutView {
                            if child.direction == .horizontal {
                                for view in child.subviews {
                                    if view == from {
                                        break
                                    }
                                    width -= view.frame.width + view.lv.margin * 2 + view.lv.marginLeft + view.lv.marginRight
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
            return width
        }
    }

    private func getViewHeight(_ from: UIView) -> CGFloat {
        if from.frame.height > 0 {
            return from.frame.height
        } else {
            var height = from.frame.height
            switch from.lv.height {
            case .fill:
                if let value = from.superview {
                    height = value.frame.height - from.lv.margin * 2 - from.lv.marginTop - from.lv.marginBottom
                    if value is LinearLayoutView || value is RelativeLayoutView || value is FlowLayoutView {
                        height = getViewHeight(value) - from.lv.margin * 2 - from.lv.marginTop - from.lv.marginBottom
                        if let child = value as? LinearLayoutView {
                            if child.direction == .vertical {
                                for view in child.subviews {
                                    if view == from {
                                        break
                                    }
                                    height -= view.frame.height + view.lv.margin * 2 + view.lv.marginTop + view.lv.marginBottom
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
            return height
        }
    }

    private func getLayoutWrapViewSize(_ from: LinearLayoutView) -> CGSize {
        var size = CGSize.zero
        for view in from.subviews {
            if from.direction == .horizontal {
                size.width += getViewWidth(view) + view.lv.margin * 2 + view.lv.marginLeft + view.lv.marginRight
                let height = getViewHeight(view) + view.lv.margin * 2 + view.lv.marginTop + view.lv.marginBottom
                if height > size.height {
                    size.height = height
                }
            } else {
                size.height += getViewHeight(view) + view.lv.margin * 2 + view.lv.marginTop + view.lv.marginBottom
                let width = getViewWidth(view) + view.lv.margin * 2 + view.lv.marginLeft + view.lv.marginRight
                if width > size.width {
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
                size.width += view.frame.width + view.lv.margin * 2 + view.lv.marginLeft + view.lv.marginRight
                size.height = view.frame.maxY + view.lv.margin + view.lv.marginBottom
            } else {
                size.height += view.frame.height + view.lv.margin * 2 + view.lv.marginTop + view.lv.marginBottom
                size.width = view.frame.maxX + view.lv.margin + view.lv.marginRight
            }
        }
        return size
    }
}
