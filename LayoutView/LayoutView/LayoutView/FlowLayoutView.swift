//
//  FlowLayoutView.swift
//  FlowLayoutView <https://github.com/QiaokeZ/iOS_LayoutView>
//
//  Created by admin on 2019/1/18.
//  Copyright © 2019 zhouqiao. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

import UIKit

class FlowLayoutView: UIView {

    private(set) var direction: LayoutDirection = .horizontal
    public var autoArrange: Bool = false

    private override init(frame: CGRect) {
        super.init(frame: .zero)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(direction: LayoutDirection = .horizontal, width: LayoutSize = .fill, height: LayoutSize = .fill) {
        super.init(frame: .zero)
        self.direction = direction
        self.gravity = gravity
        self.width = width
        self.height = height
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setChildViewSize()
        setLayoutViewFrame()
        setChildViewOrigin()
    }
}

extension FlowLayoutView {

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
        let totalSize = CGSize(width: getViewWidth(self), height: getViewHeight(self))
        var lastView: UIView?
        var max: CGSize = .zero
        for view in subviews {
            if direction == .horizontal {
                view.frame.origin = CGPoint(x: view.margin + view.marginLeft, y: view.margin + view.marginTop)
                if let value = lastView {
                    view.frame.origin.x = value.margin + view.marginRight + value.frame.maxX + view.margin + view.marginLeft
                    view.frame.origin.y = max.height + value.margin + value.marginBottom + view.margin + view.marginTop
                    if view.frame.maxX + value.margin + view.marginRight > totalSize.width {
                        view.frame.origin.x = view.margin + view.marginLeft
                        view.frame.origin.y = value.margin + value.marginBottom + value.frame.maxY + view.margin + view.marginTop
                        max.height = view.frame.origin.y - view.marginTop
                    }
                }
            } else {
                view.frame.origin = CGPoint(x: view.margin + view.marginLeft, y: view.margin + view.marginTop)
                if let value = lastView {
                    view.frame.origin.y = value.margin + view.marginBottom + value.frame.maxY + view.margin + view.marginTop
                    view.frame.origin.x = max.width + value.margin + value.marginRight + view.margin + view.marginLeft
                    if view.frame.maxY + value.margin + view.marginBottom > totalSize.height {
                        view.frame.origin.x = value.margin + value.marginRight + value.frame.maxX + view.margin + view.marginLeft
                        view.frame.origin.y = view.margin + view.marginTop
                        max.width = view.frame.origin.x - view.marginLeft
                    }
                }
            }
            lastView = view
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
            if let value = from.superview {
                width = value.frame.width - from.margin * 2 - from.marginLeft - from.marginRight
                if value is LinearLayoutView || value is RelativeLayoutView || value is FlowLayoutView {
                    width = getViewWidth(value) - from.margin * 2 - from.marginLeft - from.marginRight
                }
            }
        case .px(let value):
            width = value
        case .wrap:
            width = 0
        }
        return width
    }

    private func getViewHeight(_ from: UIView) -> CGFloat {
        var height = from.frame.height
        switch from.height {
        case .fill:
            if let value = from.superview {
                height = value.frame.height - from.margin * 2 - from.marginTop - from.marginBottom
                if value is LinearLayoutView || value is RelativeLayoutView || value is FlowLayoutView {
                    height = getViewHeight(value) - from.margin * 2 - from.marginTop - from.marginBottom
                }
            }
        case .px(let value):
            height = value
        case .wrap:
            height = 0
        }
        return height
    }
}
