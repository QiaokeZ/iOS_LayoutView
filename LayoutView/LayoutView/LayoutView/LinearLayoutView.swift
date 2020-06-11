//
//  LinearLayoutView.swift
//  LinearLayoutView <https://github.com/QiaokeZ/iOS_Swift_LayoutView>
//
//  Created by zhouqiao on 2019/1/18.
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

class LinearLayoutView: LayoutView {

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

    override func layoutSubviewsSize() {
        let measureSize = resolveSize(from: self)
        let (totalWeight, totalMarginWidth, totalMarginHeight, totalUsedWidth, totalUsedHeight) = subViewsState()
        for child in subviews {
            child.frame = .zero
            if direction == .horizontal {
                switch child.lv.height {
                case .fill:
                    child.frame.size.height = measureSize.height - (child.lv.margin * 2 + child.lv.marginTop + child.lv.marginBottom)
                case .pt(let value):
                    child.frame.size.height = value
                default: break
                }
                if child.lv.weight == 0 {
                    switch child.lv.width {
                    case .fill:
                        child.frame.size.width = measureSize.width - (child.lv.margin * 2 + child.lv.marginLeft + child.lv.marginRight)
                    case .pt(let value):
                        child.frame.size.width = value
                    default: break
                    }
                } else {
                    let childWidth = child.lv.weight * (measureSize.width - totalMarginWidth - totalUsedWidth) / totalWeight - (child.lv.marginLeft + child.lv.marginRight)
                    child.frame.size.width = childWidth
                }
            } else {
                switch child.lv.width {
                case .fill:
                    child.frame.size.width = measureSize.width - (child.lv.margin * 2 + child.lv.marginLeft + child.lv.marginRight)
                case .pt(let value):
                    child.frame.size.width = value
                default: break
                }
                if child.lv.weight == 0 {
                    switch child.lv.height {
                    case .fill:
                        child.frame.size.height = measureSize.height - (child.lv.margin * 2 + child.lv.marginTop + child.lv.marginBottom)
                    case .pt(let value):
                        child.frame.size.height = value
                    default: break
                    }
                } else {
                    let childHeight = child.lv.weight * (measureSize.height - totalMarginHeight - totalUsedHeight) / totalWeight - (child.lv.marginTop + child.lv.marginBottom)
                    child.frame.size.height = childHeight
                }
            }
            if let child = child as? LayoutView {
                child.requestLayout()
            }
        }
        layoutParentViewFrame()
    }

    override func layoutSubviewsLocation() {
        var beforeView: UIView?
        for child in subviews {
            var beforeViewSize = CGSize.zero
            if let value = beforeView {
                beforeViewSize = CGSize(width: value.frame.maxX + value.lv.margin + value.lv.marginRight, height: value.frame.maxY + value.lv.margin + value.lv.marginBottom)
            }
            if direction == .horizontal {
                child.frame.origin.x = child.lv.margin + child.lv.marginLeft + beforeViewSize.width
                switch child.lv.gravity {
                case .center, .centerVertical:
                    child.frame.origin.y = (frame.height - (child.frame.height + child.lv.margin * 2 + child.lv.marginTop + child.lv.marginBottom)) / 2
                case .bottom:
                    child.frame.origin.y = frame.height - child.frame.height - child.lv.margin - child.lv.marginBottom
                default:
                    child.frame.origin.y = child.lv.margin + child.lv.marginTop
                    break
                }
            } else {
                child.frame.origin.y = child.lv.margin + child.lv.marginTop + beforeViewSize.height
                switch child.lv.gravity {
                case .center, .centerHorizontal:
                    child.frame.origin.x = (frame.width - (child.frame.width + child.lv.margin * 2 + child.lv.marginLeft + child.lv.marginRight)) / 2
                case .right:
                    child.frame.origin.x = frame.width - child.frame.width - child.lv.margin - child.lv.marginRight
                default:
                    child.frame.origin.x = child.lv.margin + child.lv.marginLeft
                    break
                }
            }
            beforeView = child
        }
        if let beforeView = beforeView {
            let maxSize = CGSize(width: beforeView.frame.maxX + beforeView.lv.margin + beforeView.lv.marginRight, height: beforeView.frame.maxY + beforeView.lv.margin + beforeView.lv.marginBottom)
            for child in subviews {
                if direction == .horizontal {
                    let centerX = child.frame.origin.x + (frame.width - maxSize.width) / 2
                    let centerY = (frame.height - (child.frame.height + child.lv.margin * 2 + child.lv.marginTop + child.lv.marginBottom)) / 2
                    switch contentGravity {
                    case .center:
                        child.frame.origin.x = centerX
                        if child.lv.gravity == .none {
                            child.frame.origin.y = centerY
                        }
                    case .centerHorizontal:
                        child.frame.origin.x = centerX
                    case .centerVertical:
                        if child.lv.gravity == .none {
                            child.frame.origin.y = centerY
                        }
                    default: break
                    }
                } else {
                    let centerY = child.frame.origin.y + (frame.height - maxSize.height) / 2
                    let centerX = (frame.width - (child.frame.width + child.lv.margin * 2 + child.lv.marginLeft + child.lv.marginRight)) / 2
                    switch contentGravity {
                    case .center:
                        child.frame.origin.x = centerX
                        if child.lv.gravity == .none {
                            child.frame.origin.y = centerY
                        }
                        break
                    case .centerHorizontal:
                        child.frame.origin.x = centerX
                        break
                    case .centerVertical:
                        if child.lv.gravity == .none {
                            child.frame.origin.y = centerY
                        }
                    default: break
                    }
                }
            }
        }
    }

    private func layoutParentViewFrame() {
        if frame.origin == .zero {
            frame.origin = CGPoint(x: lv.margin + lv.marginLeft, y: lv.margin + lv.marginTop)
        }
        if frame.size == .zero {
            let maxSize = subViewsMaxSize()
//            let marginSize = CGSize(width: lv.margin * 2 + lv.marginLeft + lv.marginRight, height: lv.margin * 2 + lv.marginTop + lv.marginBottom)
            switch lv.width {
            case .fill:
                frame.size.width = resolveSize(from: self).width
            case .pt(let value):
                frame.size.width = value
            case .wrap:
                frame.size.width = maxSize.width
            }
            switch lv.height {
            case .fill:
                 frame.size.height = resolveSize(from: self).height 
            case .pt(let value):
                frame.size.height = value
            case .wrap:
                frame.size.height = maxSize.height
            }
        }
    }

    private func subViewsMaxSize() -> CGSize {
        var size = CGSize.zero
        for view in subviews {
            switch direction {
            case .horizontal:
                size.width += view.frame.width + view.lv.margin * 2 + view.lv.marginLeft + view.lv.marginRight
                let height = view.frame.height + view.lv.margin * 2 + view.lv.marginTop + view.lv.marginBottom
                if height > size.height {
                    size.height = height
                }
            case .vertical:
                size.height += view.frame.height + view.lv.margin * 2 + view.lv.marginTop + view.lv.marginBottom
                let width = view.frame.width + view.lv.margin * 2 + view.lv.marginLeft + view.lv.marginRight
                if width > size.width {
                    size.width = width
                }
            }
        }
        return size
    }

    private func subViewsState() -> (CGFloat, CGFloat, CGFloat, CGFloat, CGFloat) {
        var state = (weight: CGFloat(0), marginWidth: CGFloat(0), marginHeight: CGFloat(0), usedWidth: CGFloat(0), usedHeight: CGFloat(0))
        for child in subviews {
            state.marginWidth += child.lv.margin * 2 + child.lv.marginLeft + child.lv.marginRight
            state.marginHeight += child.lv.margin * 2 + child.lv.marginTop + child.lv.marginBottom
            if child.lv.weight == 0 {
                switch child.lv.width {
                case .fill:
                    state.usedWidth += frame.width
                case .pt(let value):
                    state.usedWidth += value
                default: break
                }
                switch child.lv.height {
                case .fill:
                    state.usedHeight += frame.height
                case .pt(let value):
                    state.usedHeight += value
                default: break
                }
            } else {
                state.weight += child.lv.weight
            }
        }
        return state
    }
}

