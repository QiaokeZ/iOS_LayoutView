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
        self.lv.width = width
        self.lv.height = height
    }
    
    public func layout() {
        setChildViewSize()
        setChildViewOrigin()
        setLayoutViewFrame()
    }
}

extension RelativeLayoutView {
    
    private func setChildViewSize() {
        for view in subviews {
            view.frame = .zero
            if let linear = view as? LinearLayoutView {
                linear.layout()
            } else if let relative = view as? RelativeLayoutView {
                relative.layout()
            } else if let flow = view as? FlowLayoutView {
                flow.layout()
            }else{
                view.frame.size = CGSize(width: ceil(getViewWidth(view)), height: ceil(getViewHeight(view)))
            }
        }
    }
    
    private func setChildViewOrigin() {
        let parentSize = CGSize(width: getViewWidth(self), height: getViewHeight(self))
        for view in subviews {
            view.frame.origin = CGPoint(x: view.lv.margin + view.lv.marginLeft, y: view.lv.margin + view.lv.marginTop)
            if let toTopView = view.lv.toTopOf {
                view.frame.origin.y = toTopView.frame.origin.y - toTopView.lv.margin - toTopView.lv.marginTop - (view.frame.height + view.lv.margin + view.lv.marginBottom)
            }
            if let toLeftView = view.lv.toLeftOf {
                view.frame.origin.x = toLeftView.frame.origin.x - toLeftView.lv.margin - toLeftView.lv.marginLeft - (view.frame.width + view.lv.margin + view.lv.marginRight)
            }
            if let toBottomView = view.lv.toBottomOf {
                view.frame.origin.y = toBottomView.frame.maxY + toBottomView.lv.margin + toBottomView.lv.marginBottom + view.lv.margin + view.lv.marginTop
            }
            if let toRightView = view.lv.toRightOf {
                view.frame.origin.x = toRightView.frame.maxX + toRightView.lv.margin + toRightView.lv.marginRight + view.lv.margin + view.lv.marginLeft
            }
            if let alignTopView = view.lv.alignTop {
                view.frame.origin.y = alignTopView.frame.origin.y + view.lv.margin + view.lv.marginTop
            }
            if let alignLeftView = view.lv.alignLeft {
                view.frame.origin.x = alignLeftView.frame.origin.x + view.lv.margin + view.lv.marginLeft
            }
            if let alignBottomView = view.lv.alignBottom {
                view.frame.origin.y = alignBottomView.frame.maxY - (view.frame.height + view.lv.margin + view.lv.marginBottom)
            }
            if let alignRightView = view.lv.alignRight {
                view.frame.origin.x = alignRightView.frame.maxX - (view.frame.width + view.lv.margin + view.lv.marginLeft)
            }
            if view.lv.alignParent.contains(.top) {
                view.frame.origin.y = view.lv.margin + view.lv.marginTop
            }
            if view.lv.alignParent.contains(.left) {
                view.frame.origin.x = view.lv.margin + view.lv.marginLeft
            }
            if view.lv.alignParent.contains(.bottom) {
                view.frame.origin.y = parentSize.height - (view.frame.height + view.lv.margin + view.lv.marginBottom)
            }
            if view.lv.alignParent.contains(.right) {
                view.frame.origin.x = parentSize.width - (view.frame.width + view.lv.margin + view.lv.marginRight)
            }
            if view.lv.gravity == .center {
                view.frame.origin = CGPoint(x: ((parentSize.width - view.frame.width) / 2) + (view.lv.marginLeft - view.lv.marginRight), y: ((parentSize.height - view.frame.height) / 2) + (view.lv.marginTop - view.lv.marginBottom))
            }
            if view.lv.gravity == .centerHorizontal {
                view.frame.origin.x = ((parentSize.width - view.frame.width) / 2) + (view.lv.marginLeft - view.lv.marginRight)
            }
            if view.lv.gravity == .centerVertical {
                view.frame.origin.y = ((parentSize.height - view.frame.height) / 2) + (view.lv.marginTop - view.lv.marginBottom)
            }
        }
    }
    
    private func setLayoutViewFrame() {
        if frame == .zero {
            frame.size = CGSize(width: ceil(getViewWidth(self)), height: ceil(getViewHeight(self)))
            frame.origin = CGPoint(x:lv.margin + lv.marginLeft, y: lv.margin + lv.marginTop)
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
                    }
                }
            case .pt(let value):
                width = value
            case .wrap:
                width = from.subviews.map { $0.frame.maxX + $0.lv.margin + $0.lv.marginLeft }.max() ?? 0
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
                    }
                }
            case .pt(let value):
                height = value
            case .wrap:
                height = from.subviews.map { $0.frame.maxX + $0.lv.margin + $0.lv.marginBottom }.max() ?? 0
            }
            return height
        }
    }
}
