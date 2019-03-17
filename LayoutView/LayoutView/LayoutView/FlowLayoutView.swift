//
//  FlowLayoutView.swift
//  FlowLayoutView <https://github.com/QiaokeZ/iOS_Swift_LayoutView>
//
//  Created by admin on 2019/1/18.
//  Copyright © 2019 zhouqiao. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

import UIKit

enum FlowLayoutDirection: Int {
    case vertical
    case horizontal
}

class FlowLayoutView: UIView {
    
    private(set) var direction: FlowLayoutDirection = .horizontal
    public var autoArrange: Bool = false
    
    private override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(direction: FlowLayoutDirection = .horizontal, width: LayoutSize = .fill, height: LayoutSize = .fill) {
        super.init(frame: .zero)
        self.direction = direction
        self.lv.width = width
        self.lv.height = height
    }
    
    public func layout() {
        setChildViewSize()
        setLayoutViewFrame()
        setChildViewOrigin()
    }
}

extension FlowLayoutView {
    
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
        let totalSize = CGSize(width: getViewWidth(self), height: getViewHeight(self))
        var lastView: UIView?
        var max: CGSize = .zero
        for view in subviews {
            if direction == .horizontal {
                view.frame.origin = CGPoint(x: view.lv.margin + view.lv.marginLeft, y: view.lv.margin + view.lv.marginTop)
                if let value = lastView {
                    view.frame.origin.x = value.lv.margin + view.lv.marginRight + value.frame.maxX + view.lv.margin + view.lv.marginLeft
                    view.frame.origin.y = max.height + value.lv.margin + value.lv.marginBottom + view.lv.margin + view.lv.marginTop
                    if view.frame.maxX + value.lv.margin + view.lv.marginRight > totalSize.width {
                        view.frame.origin.x = view.lv.margin + view.lv.marginLeft
                        view.frame.origin.y = value.lv.margin + value.lv.marginBottom + value.frame.maxY + view.lv.margin + view.lv.marginTop
                        max.height = view.frame.origin.y - view.lv.marginTop
                    }
                }
            } else {
                view.frame.origin = CGPoint(x: view.lv.margin + view.lv.marginLeft, y: view.lv.margin + view.lv.marginTop)
                if let value = lastView {
                    view.frame.origin.y = value.lv.margin + view.lv.marginBottom + value.frame.maxY + view.lv.margin + view.lv.marginTop
                    view.frame.origin.x = max.width + value.lv.margin + value.lv.marginRight + view.lv.margin + view.lv.marginLeft
                    if view.frame.maxY + value.lv.margin + view.lv.marginBottom > totalSize.height {
                        view.frame.origin.x = value.lv.margin + value.lv.marginRight + value.frame.maxX + view.lv.margin + view.lv.marginLeft
                        view.frame.origin.y = view.lv.margin + view.lv.marginTop
                        max.width = view.frame.origin.x - view.lv.marginLeft
                    }
                }
            }
            lastView = view
        }
    }
    
    private func setLayoutViewFrame() {
        if frame == .zero {
            frame.size = CGSize(width: ceil(getViewWidth(self)), height: ceil(getViewHeight(self)))
            frame.origin = CGPoint(x: lv.margin + lv.marginLeft, y: lv.margin + lv.marginTop)
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
                width = 0
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
                height = 0
            }
            return height
        }
    }
}
