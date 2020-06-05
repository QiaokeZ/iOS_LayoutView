//
//  UIView+Layout.swift
//  UIView+Layout <https://github.com/QiaokeZ/iOS_Swift_LayoutView>
//
//  Created by admin on 2019/1/18.
//  Copyright © 2019 zhouqiao. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

import UIKit

enum LayoutSize {
    case fill
    case wrap
    case pt(CGFloat)
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

extension LayoutView1 where Base: UIView {

    var margin: CGFloat {
        set {
            objc_setAssociatedObject(base, &marginKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            if let value = objc_getAssociatedObject(base, &marginKey) as? CGFloat {
                return value
            }
            return 0
        }
    }

    var marginTop: CGFloat {
        set {
            objc_setAssociatedObject(base, &marginTopKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            if let value = objc_getAssociatedObject(base, &marginTopKey) as? CGFloat {
                return value
            }
            return 0
        }
    }

    var marginLeft: CGFloat {
        set {
            objc_setAssociatedObject(base, &marginLeftKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            if let value = objc_getAssociatedObject(base, &marginLeftKey) as? CGFloat {
                return value
            }
            return 0
        }
    }

    var marginRight: CGFloat {
        set {
            objc_setAssociatedObject(base, &marginRightKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            if let value = objc_getAssociatedObject(base, &marginRightKey) as? CGFloat {
                return value
            }
            return 0
        }
    }

    var marginBottom: CGFloat {
        set {
            objc_setAssociatedObject(base, &marginBottomKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            if let value = objc_getAssociatedObject(base, &marginBottomKey) as? CGFloat {
                return value
            }
            return 0
        }
    }

    var weight: CGFloat {
        set {
            objc_setAssociatedObject(base, &weightKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            if let value = objc_getAssociatedObject(base, &weightKey) as? CGFloat {
                return value
            }
            return 0
        }
    }

    var gravity: LayoutGravity {
        set {
            objc_setAssociatedObject(base, &gravityKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            if let value = objc_getAssociatedObject(base, &gravityKey) as? LayoutGravity {
                return value
            }
            return .none
        }
    }

    var height: LayoutSize {
        set {
            objc_setAssociatedObject(base, &heightKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            if let value = objc_getAssociatedObject(base, &heightKey) as? LayoutSize {
                return value
            }
            return LayoutSize.pt(0)
        }
    }

    var width: LayoutSize {
        set {
            objc_setAssociatedObject(base, &widthKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            if let value = objc_getAssociatedObject(base, &widthKey) as? LayoutSize {
                return value
            }
            return LayoutSize.pt(0)
        }
    }

    var toTopOf: UIView? {
        set {
            objc_setAssociatedObject(base, &toTopOfKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            return objc_getAssociatedObject(base, &toTopOfKey) as? UIView
        }
    }

    var toLeftOf: UIView? {
        set {
            objc_setAssociatedObject(base, &toLeftOfKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            return objc_getAssociatedObject(base, &toLeftOfKey) as? UIView
        }
    }

    var toRightOf: UIView? {
        set {
            objc_setAssociatedObject(base, &toRightOfKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            return objc_getAssociatedObject(base, &toRightOfKey) as? UIView
        }
    }

    var toBottomOf: UIView? {
        set {
            objc_setAssociatedObject(base, &toBottomOfKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            return objc_getAssociatedObject(base, &toBottomOfKey) as? UIView
        }
    }

    var alignTop: UIView? {
        set {
            objc_setAssociatedObject(base, &alignTopKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            return objc_getAssociatedObject(base, &alignTopKey) as? UIView
        }
    }

    var alignLeft: UIView? {
        set {
            objc_setAssociatedObject(base, &alignLeftKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            return objc_getAssociatedObject(base, &alignLeftKey) as? UIView
        }
    }

    var alignBottom: UIView? {
        set {
            objc_setAssociatedObject(base, &alignBottomKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            return objc_getAssociatedObject(base, &alignBottomKey) as? UIView
        }
    }

    var alignRight: UIView? {
        set {
            objc_setAssociatedObject(base, &alignRightKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            return objc_getAssociatedObject(base, &alignRightKey) as? UIView
        }
    }

    var alignParent: LayoutAlignParent {
        set {
            objc_setAssociatedObject(base, &alignParentKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            if let value = objc_getAssociatedObject(base, &alignParentKey) as? LayoutAlignParent {
                return value
            }
            return [.none]
        }
    }

    var superviews:[UIView] {
        get {
            var superviews = [UIView]()
            var next:UIView? = base
            while next != nil {
                guard let value = next?.superview else {
                    superviews.append(base)
                    return superviews
                }
                superviews.append(value)
                next = value
            }
            return superviews
        }
    }
}

private var marginKey: Void?
private var marginTopKey: Void?
private var marginLeftKey: Void?
private var marginBottomKey: Void?
private var marginRightKey: Void?
private var weightKey: Void?
private var gravityKey: Void?
private var heightKey: Void?
private var widthKey: Void?
private var toTopOfKey: Void?
private var toBottomOfKey: Void?
private var toLeftOfKey: Void?
private var toRightOfKey: Void?
private var alignTopKey: Void?
private var alignLeftKey: Void?
private var alignBottomKey: Void?
private var alignRightKey: Void?
private var alignParentKey: Void?

public final class LayoutView1<Base> {
    public let base: Base
    public init(_ base: Base) {
        self.base = base
    }
}

public protocol LayoutViewCompatible {
    associatedtype CompatibleType
    var lv: CompatibleType { get }
}

public extension LayoutViewCompatible {
    var lv: LayoutView1<Self> {
        get { return LayoutView1(self) }
    }
}

extension UIView: LayoutViewCompatible { }
