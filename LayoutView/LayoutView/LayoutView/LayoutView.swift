//
//  LayoutView.swift
//  LayoutView
//
//  Created by admin on 2019/2/22.
//  Copyright © 2019 zhouqiao. All rights reserved.
//

import UIKit

public final class LayoutView<Base> {
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
    public var lv: LayoutView<Self> {
        get { return LayoutView(self) }
    }
}

extension UIView: LayoutViewCompatible { }
