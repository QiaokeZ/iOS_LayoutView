//
//  LayoutView.swift
//  LayoutView <https://github.com/QiaokeZ/iOS_Swift_LayoutView>
//
//  Created by zhouqiao on 2019/1/18.
//  Copyright © 2019 zhouqiao. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

import UIKit

protocol Layoutable {
    var parent: LayoutView { get }
    func requestLayout()
}

extension Layoutable {

    func resolveSize(from: UIView) -> CGSize {
        return CGSize(width: resolveWidth(from: from), height: resolveHeight(from: from))
    }

    func resolveWidth(from: UIView) -> CGFloat {
        var width: CGFloat = from.frame.width
        if width == .zero {
            switch from.lv.width {
            case .fill:
                var parent: UIView? = from.superview
                var margin = from.lv.margin * 2 + from.lv.marginLeft + from.lv.marginRight
                while parent != nil {
                    if let view = parent {
                        if view.lv.width == .wrap {
                            parent = nil
                            break
                        }
                        margin += view.lv.margin * 2 + view.lv.marginLeft + view.lv.marginRight
                        if view.frame.width != 0 {
                            break
                        } else {
                            parent = view.superview
                        }
                    }
                }
                if let view = parent {
                    width = view.frame.width - margin
                }
            case .pt(let value):
                width = value
            case .wrap: break
            }
        }
        return width
    }

    func resolveHeight(from: UIView) -> CGFloat {
        var height: CGFloat = from.frame.height
        if height == .zero {
            switch from.lv.height {
            case .fill:
                var parent: UIView? = from.superview
                var margin = from.lv.margin * 2 + from.lv.marginTop + from.lv.marginBottom
                while parent != nil {
                    if let view = parent {
                        if view.lv.width == .wrap {
                            parent = nil
                            break
                        }
                        margin += view.lv.margin * 2 + view.lv.marginTop + view.lv.marginBottom
                        if view.frame.height != 0 {
                            break
                        } else {
                            parent = view.superview
                        }
                    }
                }
                if let view = parent {
                    height = view.frame.height - margin
                }
            case .pt(let value):
                height = value
            case .wrap: break
            }
        }
        return height
    }
}

class LayoutView: UIView, Layoutable {

    var parent: LayoutView {
        get {
            if let parent = lv.superviews.reversed().first(where: { return $0.isKind(of: LayoutView.self) }) as? LayoutView {
                return parent
            }
            return self
        }
    }

    override func addSubview(_ view: UIView) {
        super.addSubview(view)
        parent.frame = .zero
        parent.requestLayout()
    }

    func requestLayout() {
        layoutSubviewsSize()
        layoutSubviewsLocation()
    }
    
    func updateLayout() {
        parent.frame = .zero
        requestLayout()
    }

    func layoutSubviewsSize() { }

    func layoutSubviewsLocation() { }
}

