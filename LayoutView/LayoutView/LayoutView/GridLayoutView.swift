//
//  FlowLayoutView.swift
//  FlowLayoutView <https://github.com/QiaokeZ/iOS_Swift_LayoutView>
//
//  Created by admin on 2019/4/3.
//  Copyright © 2019 zhouqiao. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

import UIKit

class GridLayoutView: UIView {

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

extension GridLayoutView {

    private func setChildViewSize() {
        let parentSize = CGSize(width: getViewWidth(self), height: getViewHeight(self))
        for view in subviews {
            view.frame = .zero
            if view.lv.columnScale > 1 || view.lv.columnScale < 0 {
                view.frame.size.width = ceil(parentSize.width - (view.lv.margin * 2 + view.lv.marginLeft + view.lv.marginRight))
            } else {
                view.frame.size.width = ceil((parentSize.width * view.lv.columnScale) - (view.lv.margin * 2 + view.lv.marginLeft + view.lv.marginRight))
            }
            if view.lv.rowScale > 1 || view.lv.rowScale < 0 {
                view.frame.size.height = ceil(parentSize.height - (view.lv.margin * 2 + view.lv.marginTop + view.lv.marginBottom))
            } else {
                view.frame.size.height = ceil((parentSize.height * view.lv.rowScale) - (view.lv.margin * 2 + view.lv.marginTop + view.lv.marginBottom))
            }
            if let linear = view as? LinearLayoutView {
                linear.layout()
            } else if let relative = view as? RelativeLayoutView {
                relative.layout()
            } else if let flow = view as? FlowLayoutView {
                flow.layout()
            } else if let grid = view as? GridLayoutView {
                grid.layout()
            }
        }
    }

    private func setChildViewOrigin() {
        let parentSize = CGSize(width: getViewWidth(self), height: getViewHeight(self))
        for view in subviews {
            let max = CGPoint(x: subviews.map { $0.frame.maxX + $0.lv.margin + $0.lv.marginRight }.max() ?? 0, y: subviews.map { $0.frame.maxY + $0.lv.margin + $0.lv.marginBottom }.max() ?? 0)
            
            view.frame.origin = CGPoint(x: view.lv.margin + view.lv.marginLeft, y: view.lv.margin + view.lv.marginTop)
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
                    if value is LinearLayoutView || value is RelativeLayoutView || value is FlowLayoutView || value is GridLayoutView {
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
                    if value is LinearLayoutView || value is RelativeLayoutView || value is FlowLayoutView || value is GridLayoutView {
                        height = getViewHeight(value) - from.lv.margin * 2 - from.lv.marginTop - from.lv.marginBottom
                    }
                }
            case .pt(let value):
                height = value
            case .wrap:
                height = from.subviews.map { $0.frame.maxY + $0.lv.margin + $0.lv.marginBottom }.max() ?? 0
            }
            return height
        }
    }
}
