//
//  LayoutView.swift
//  LayoutView
//
//  Created by admin on 2020/6/5.
//  Copyright © 2020 zhouqiao. All rights reserved.
//

import UIKit

protocol LayoutViewable {
    func layoutViewRoot()
}

class LayoutView: UIView, LayoutViewable {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func layoutViewRoot() {
        
    }
    
    func layoutViewRootFrame() {
          
    }
    
    func layoutSubviewsOrigin() {
        
    }
    
    func layoutSubviewsSize() {
        
    }
}

extension LayoutViewable {
    
    public func isWrap(_ size: LayoutSize) -> Bool {
        switch size {
        case .fill:
            return false
        case .wrap:
            return true
        case .pt(_):
            return false
        }
    }
    
    public func getViewWidth(_ from: UIView) -> CGFloat {
        var width = from.frame.width
        switch from.lv.width {
        case .fill:
            if let view = from.superview {
                width = view.frame.width - from.lv.margin * 2 - from.lv.marginLeft - from.lv.marginRight
                if view.isKind(of: LayoutView.self) {
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
    
    public func getViewHeight(_ from: UIView) -> CGFloat {
        var height = from.frame.height
        switch from.lv.height {
        case .fill:
            if let view = from.superview {
                height = view.frame.height - from.lv.margin * 2 - from.lv.marginTop - from.lv.marginBottom
                if view.isKind(of: LayoutView.self)  {
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
    
    public func getLayoutWrapViewSize(_ from: LinearLayoutView) -> CGSize {
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
}
