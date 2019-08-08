//
//  UIView.swift
//  EasyCharging
//
//  Created by admin on 2018/9/21.
//  Copyright © 2018年 easycharging. All rights reserved.
//

import UIKit

private struct AssociatedKeys {
    static let dataKey = UnsafeRawPointer(bitPattern: "dataKey".hashValue)
}

extension UIView {
    
    var x: CGFloat {
        get {
            return frame.origin.x
        }
        set(newValue) {
            var tmpFrame: CGRect = frame
            tmpFrame.origin.x = newValue
            frame = tmpFrame
        }
    }
    
    var y: CGFloat {
        get {
            return frame.origin.y
        }
        set(newValue) {
            var tmpFrame: CGRect = frame
            tmpFrame.origin.y = newValue
            frame = tmpFrame
        }
    }
    
    var height: CGFloat {
        get {
            return frame.size.height
        }
        set(newValue) {
            var tmpFrame: CGRect = frame
            tmpFrame.size.height = newValue
            frame = tmpFrame
        }
    }
    
    var width: CGFloat {
        get {
            return frame.size.width
        }
        set(newValue) {
            var tmpFrame: CGRect = frame
            tmpFrame.size.width = newValue
            frame = tmpFrame
        }
    }
    
    var centerX: CGFloat {
        get {
            return center.x
        }
        set(newValue) {
            center = CGPoint(x: newValue, y: center.y)
        }
    }
    
    var centerY: CGFloat {
        get {
            return center.y
        }
        set(newValue) {
            center = CGPoint(x: center.x, y: newValue)
        }
    }
    
    var toImage: UIImage? {
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.main.scale)
        layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    func addCorner(roundingCorners: UIRectCorner, cornerSize: CGSize) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: roundingCorners, cornerRadii: cornerSize)
        let cornerLayer = CAShapeLayer()
        cornerLayer.frame = bounds
        cornerLayer.path = path.cgPath
        layer.mask = cornerLayer
    }
    
    static var className: String {
        return String(describing: self)
    }
    
    var data: Any? {
        set {
            objc_setAssociatedObject(self, AssociatedKeys.dataKey!, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            let value = objc_getAssociatedObject(self, AssociatedKeys.dataKey!)
            return value
        }
    }
}
