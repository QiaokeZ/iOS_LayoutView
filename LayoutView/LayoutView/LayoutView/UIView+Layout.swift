//
//  UIView+Layout.swift
//  UIView+Layout <https://github.com/QiaokeZ/iOS_LayoutView>
//
//  Created by admin on 2019/1/18.
//  Copyright © 2019 zhouqiao. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

import UIKit

enum LayoutDirection: Int {
    case vertical
    case horizontal
}

enum LayoutSize {
    case fill
    case wrap
    case px(CGFloat)
}

enum LayoutGravity {
    case none
    case top
    case left
    case bottom
    case right
    case center
    case centerHorizontal
    case centerVertical
}

struct LayoutAlignParent: OptionSet {
    let rawValue: UInt
    static let none = LayoutAlignParent(rawValue: 0)
    static let top = LayoutAlignParent(rawValue: 1 << 0)
    static let left = LayoutAlignParent(rawValue: 1 << 1)
    static let bottom = LayoutAlignParent(rawValue: 1 << 2)
    static let right = LayoutAlignParent(rawValue: 1 << 3)
}

extension UIView {

    var height: LayoutSize {
        set {
            objc_setAssociatedObject(self, AssociatedKeys.heightKey!, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            if let value = objc_getAssociatedObject(self, AssociatedKeys.heightKey!) as? LayoutSize {
                return value
            }
            return LayoutSize.px(0)
        }
    }

    var width: LayoutSize {
        set {
            objc_setAssociatedObject(self, AssociatedKeys.widthKey!, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            if let value = objc_getAssociatedObject(self, AssociatedKeys.widthKey!) as? LayoutSize {
                return value
            }
            return LayoutSize.px(0)
        }
    }

    var gravity: LayoutGravity {
        set {
            objc_setAssociatedObject(self, AssociatedKeys.gravityKey!, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            if let value = objc_getAssociatedObject(self, AssociatedKeys.gravityKey!) as? LayoutGravity {
                return value
            }
            return .none
        }
    }

    var weight: CGFloat {
        set {
            objc_setAssociatedObject(self, AssociatedKeys.weightKey!, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
        get {
            if let value = objc_getAssociatedObject(self, AssociatedKeys.weightKey!) as? CGFloat {
                return value
            }
            return 0
        }
    }
    
    var marginRight: CGFloat {
        set {
            objc_setAssociatedObject(self, AssociatedKeys.marginRightKey!, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
        get {
            if let value = objc_getAssociatedObject(self, AssociatedKeys.marginRightKey!) as? CGFloat {
                return value
            }
            return 0
        }
    }

    var marginBottom: CGFloat {
        set {
            objc_setAssociatedObject(self, AssociatedKeys.marginBottomKey!, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
        get {
            if let value = objc_getAssociatedObject(self, AssociatedKeys.marginBottomKey!) as? CGFloat {
                return value
            }
            return 0
        }
    }

    var marginLeft: CGFloat {
        set {
            objc_setAssociatedObject(self, AssociatedKeys.marginLeftKey!, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
        get {
            if let value = objc_getAssociatedObject(self, AssociatedKeys.marginLeftKey!) as? CGFloat {
                return value
            }
            return 0
        }
    }

    var marginTop: CGFloat {
        set {
            objc_setAssociatedObject(self, AssociatedKeys.marginTopKey!, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
        get {
            if let value = objc_getAssociatedObject(self, AssociatedKeys.marginTopKey!) as? CGFloat {
                return value
            }
            return 0
        }
    }

    var margin: CGFloat {
        set {
            objc_setAssociatedObject(self, AssociatedKeys.marginKey!, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
        get {
            if let value = objc_getAssociatedObject(self, AssociatedKeys.marginKey!) as? CGFloat {
                return value
            }
            return 0
        }
    }

    var alignParent: LayoutAlignParent {
        set {
            objc_setAssociatedObject(self, AssociatedKeys.alignParentKey!, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
        get {
            if let value = objc_getAssociatedObject(self, AssociatedKeys.alignParentKey!) as? LayoutAlignParent {
                return value
            }
            return [.none]
        }
    }

    var alignBottom: UIView? {
        set {
            objc_setAssociatedObject(self, AssociatedKeys.alignBottomKey!, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            return objc_getAssociatedObject(self, AssociatedKeys.alignBottomKey!) as? UIView
        }
    }

    var alignTop: UIView? {
        set {
            objc_setAssociatedObject(self, AssociatedKeys.alignTopKey!, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            return objc_getAssociatedObject(self, AssociatedKeys.alignTopKey!) as? UIView
        }
    }

    var alignRight: UIView? {
        set {
            objc_setAssociatedObject(self, AssociatedKeys.alignRightKey!, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            return objc_getAssociatedObject(self, AssociatedKeys.alignRightKey!) as? UIView
        }
    }

    var alignLeft: UIView? {
        set {
            objc_setAssociatedObject(self, AssociatedKeys.alignLeftKey!, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            return objc_getAssociatedObject(self, AssociatedKeys.alignLeftKey!) as? UIView
        }
    }

    var toRightOf: UIView? {
        set {
            objc_setAssociatedObject(self, AssociatedKeys.toRightOfKey!, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            return objc_getAssociatedObject(self, AssociatedKeys.toRightOfKey!) as? UIView
        }
    }

    var toLeftOf: UIView? {
        set {
            objc_setAssociatedObject(self, AssociatedKeys.toLeftOfKey!, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            return objc_getAssociatedObject(self, AssociatedKeys.toLeftOfKey!) as? UIView
        }
    }

    var toBottomOf: UIView? {
        set {
            objc_setAssociatedObject(self, AssociatedKeys.toBottomOfKey!, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            return objc_getAssociatedObject(self, AssociatedKeys.toBottomOfKey!) as? UIView
        }
    }

    var toTopOf: UIView? {
        set {
            objc_setAssociatedObject(self, AssociatedKeys.toTopOfKey!, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            return objc_getAssociatedObject(self, AssociatedKeys.toTopOfKey!) as? UIView
        }
    }
}

private struct AssociatedKeys {
    static let marginKey = UnsafeRawPointer(bitPattern: "marginKey".hashValue)
    static let marginTopKey = UnsafeRawPointer(bitPattern: "marginTopKey".hashValue)
    static let marginLeftKey = UnsafeRawPointer(bitPattern: "marginLeftKey".hashValue)
    static let marginBottomKey = UnsafeRawPointer(bitPattern: "marginBottomKey".hashValue)
    static let marginRightKey = UnsafeRawPointer(bitPattern: "marginRightKey".hashValue)
    static let weightKey = UnsafeRawPointer(bitPattern: "weightKey".hashValue)
    static let gravityKey = UnsafeRawPointer(bitPattern: "gravityKey".hashValue)
    static let heightKey = UnsafeRawPointer(bitPattern: "heightKey".hashValue)
    static let widthKey = UnsafeRawPointer(bitPattern: "widthKey".hashValue)
    static let toTopOfKey = UnsafeRawPointer(bitPattern: "toTopOfKey".hashValue)
    static let toBottomOfKey = UnsafeRawPointer(bitPattern: "toBottomOfKey".hashValue)
    static let toLeftOfKey = UnsafeRawPointer(bitPattern: "toLeftOfKey".hashValue)
    static let toRightOfKey = UnsafeRawPointer(bitPattern: "toRightOfKey".hashValue)
    static let alignTopKey = UnsafeRawPointer(bitPattern: "alignTopKey".hashValue)
    static let alignLeftKey = UnsafeRawPointer(bitPattern: "alignLeftKey".hashValue)
    static let alignBottomKey = UnsafeRawPointer(bitPattern: "alignBottomKey".hashValue)
    static let alignRightKey = UnsafeRawPointer(bitPattern: "alignRightKey".hashValue)
    static let alignParentKey = UnsafeRawPointer(bitPattern: "alignParentKey".hashValue)
}
