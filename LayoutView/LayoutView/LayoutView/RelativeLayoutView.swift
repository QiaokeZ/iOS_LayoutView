//
//  RelativeLayoutView.swift
//  RelativeLayoutView <https://github.com/QiaokeZ/iOS_Swift_LayoutView>
//
//  Created by zhouqiao on 2019/1/18.
//  Copyright © 2019 zhouqiao. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

import UIKit

class RelativeLayoutView: LayoutView {

    private override init(frame: CGRect) {
        super.init(frame: .zero)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    init(width: LayoutSize = .fill, height: LayoutSize = .fill) {
        super.init(frame: .zero)
        self.lv.width = width
        self.lv.height = height
    }

    override func layoutSubviewsSize() {
        for child in subviews {
            child.frame = .zero
            if let child = child as? LayoutView {
                child.requestLayout()
            } else {
                child.frame.size = resolveSize(from: child)
            }
        }
    }

    override func layoutSubviewsLocation() {
        let measureSize = resolveSize(from: self)
        for child in subviews {
            child.frame.origin = CGPoint(x: child.lv.margin + child.lv.marginLeft, y: child.lv.margin + child.lv.marginTop)
            if let toTopView = child.lv.toTopOf {
                child.frame.origin.y = toTopView.frame.origin.y - toTopView.lv.margin - toTopView.lv.marginTop - (child.frame.height + child.lv.margin + child.lv.marginBottom)
            }
            if let toLeftView = child.lv.toLeftOf {
                child.frame.origin.x = toLeftView.frame.origin.x - toLeftView.lv.margin - toLeftView.lv.marginLeft - (child.frame.width + child.lv.margin + child.lv.marginRight)
            }
            if let toBottomView = child.lv.toBottomOf {
                child.frame.origin.y = toBottomView.frame.maxY + toBottomView.lv.margin + toBottomView.lv.marginBottom + child.lv.margin + child.lv.marginTop
            }
            if let toRightView = child.lv.toRightOf {
                child.frame.origin.x = toRightView.frame.maxX + toRightView.lv.margin + toRightView.lv.marginRight + child.lv.margin + child.lv.marginLeft
            }
            if let alignTopView = child.lv.alignTop {
                child.frame.origin.y = alignTopView.frame.origin.y + child.lv.margin + child.lv.marginTop
            }
            if let alignLeftView = child.lv.alignLeft {
                child.frame.origin.x = alignLeftView.frame.origin.x + child.lv.margin + child.lv.marginLeft
            }
            if let alignBottomView = child.lv.alignBottom {
                child.frame.origin.y = alignBottomView.frame.maxY - (child.frame.height + child.lv.margin + child.lv.marginBottom)
            }
            if let alignRightView = child.lv.alignRight {
                child.frame.origin.x = alignRightView.frame.maxX - (child.frame.width + child.lv.margin + child.lv.marginLeft)
            }
            if child.lv.alignParent.contains(.top) {
                child.frame.origin.y = child.lv.margin + child.lv.marginTop
            }
            if child.lv.alignParent.contains(.left) {
                child.frame.origin.x = child.lv.margin + child.lv.marginLeft
            }
            if child.lv.alignParent.contains(.bottom) {
                child.frame.origin.y = measureSize.height - (child.frame.height + child.lv.margin + child.lv.marginBottom)
            }
            if child.lv.alignParent.contains(.right) {
                child.frame.origin.x = measureSize.width - (child.frame.width + child.lv.margin + child.lv.marginRight)
            }
            if child.lv.gravity == .center {
                child.frame.origin = CGPoint(x: ((measureSize.width - child.frame.width) / 2) + (child.lv.marginLeft - child.lv.marginRight), y: ((measureSize.height - child.frame.height) / 2) + (child.lv.marginTop - child.lv.marginBottom))
            }
            if child.lv.gravity == .centerHorizontal {
                child.frame.origin.x = ((measureSize.width - child.frame.width) / 2) + (child.lv.marginLeft - child.lv.marginRight)
            }
            if child.lv.gravity == .centerVertical {
                child.frame.origin.y = ((measureSize.height - child.frame.height) / 2) + (child.lv.marginTop - child.lv.marginBottom)
            }
        }
        layoutParentViewFrame()
    }

    private func layoutParentViewFrame() {
        if frame.origin == .zero {
            frame.origin = CGPoint(x: lv.margin + lv.marginLeft, y: lv.margin + lv.marginTop)
        }
        if frame.size == .zero {
            switch lv.width {
            case .fill:
                frame.size.width = resolveSize(from: self).width
            case .pt(let value):
                frame.size.width = value
            case .wrap:
                frame.size.width = subviews.map { $0.frame.maxX + $0.lv.margin + $0.lv.marginLeft }.max() ?? 0
            }
            switch lv.height {
            case .fill:
                frame.size.height = resolveSize(from: self).height
            case .pt(let value):
                frame.size.height = value
            case .wrap:
                frame.size.height = subviews.map { $0.frame.maxY + $0.lv.margin + $0.lv.marginBottom }.max() ?? 0
            }
        }
    }
}
