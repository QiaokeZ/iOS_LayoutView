//
//  RelativeLayoutView.swift
//  RelativeLayoutView <https://github.com/QiaokeZ/iOS_LayoutView>
//
//  Created by admin on 2019/1/18.
//  Copyright © 2019 zhouqiao. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

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

    override func layoutSubviews() {
        super.layoutSubviews()
        setChildViewSize()
        setChildViewOrigin()
        setLayoutViewFrame()
    }
}

extension RelativeLayoutView {

    private func setChildViewSize() {
        for view in subviews {
            view.frame = .zero
            if view is LinearLayoutView || view is RelativeLayoutView || view is FlowLayoutView {
                view.setNeedsLayout()
                view.layoutIfNeeded()
            } else {
                view.frame.size = CGSize(width: getViewWidth(view), height: getViewHeight(view))
            }
        }
    }

    private func setChildViewOrigin() {
        let parentSize = CGSize(width: getViewWidth(self), height: getViewHeight(self))
        for view in subviews {
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

    private func setLayoutViewFrame() {
        if frame == .zero {
            frame.size = CGSize(width: getViewWidth(self), height: getViewHeight(self))
            frame.origin = CGPoint(x: margin + marginLeft, y: margin + marginTop)
        }
    }

    private func getViewWidth(_ from: UIView) -> CGFloat {
        var width = from.frame.width
        switch from.width {
        case .fill:
            if let value = from.superview, width == 0 {
                width = value.frame.width - from.margin * 2 - from.marginLeft - from.marginRight
                if value is LinearLayoutView || value is RelativeLayoutView || value is FlowLayoutView {
                    width = getViewWidth(value) - from.margin * 2 - from.marginLeft - from.marginRight
                }
            }
        case .px(let value):
            width = value
        case .wrap:
            width = from.subviews.map { $0.frame.maxX + $0.margin + $0.marginLeft }.max() ?? 0
        }
        return width
    }

    private func getViewHeight(_ from: UIView) -> CGFloat {
        var height = from.frame.height
        switch from.height {
        case .fill:
            if let value = from.superview, height == 0 {
                height = value.frame.height - from.margin * 2 - from.marginTop - from.marginBottom
                if value is LinearLayoutView || value is RelativeLayoutView || value is FlowLayoutView {
                    height = getViewHeight(value) - from.margin * 2 - from.marginTop - from.marginBottom
                }
            }
        case .px(let value):
            height = value
        case .wrap:
            height = from.subviews.map { $0.frame.maxX + $0.margin + $0.marginBottom }.max() ?? 0
        }
        return height
    }
}
