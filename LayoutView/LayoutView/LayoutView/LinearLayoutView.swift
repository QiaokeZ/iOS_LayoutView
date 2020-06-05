//
//  LinearLayoutView.swift
//  LinearLayoutView <https://github.com/QiaokeZ/iOS_Swift_LayoutView>
//
//  Created by admin on 2019/1/18.
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
    
    override func addSubview(_ view: UIView) {
        super.addSubview(view)
        guard let viewRoot = self.lv.superviews.reversed().first(where: { return $0.isKind(of: LayoutView.self) }) as? LayoutView  else { return }
        layoutViewRoot1(of: viewRoot)
    }
    
    
    func layoutViewRoot1(of : LayoutView) {
        
        let rootViewSize = CGSize(width: getViewWidth(of), height: getViewHeight(of))
        let totalWeight = of.subviews.reduce(CGFloat(0)) { (value, view) in
            view.frame = .zero
            return value + view.lv.weight
        }
        
        let totalMarginSize = of.subviews.reduce(CGSize.zero) { (value, view) in
            let marginWidth = value.width + (view.lv.margin * 2 + view.lv.marginLeft + view.lv.marginRight)
            let marginHeight = value.height + (view.lv.margin * 2 + view.lv.marginTop + view.lv.marginBottom)
            return CGSize(width: marginWidth, height: marginHeight)
        }
        print("totalWeight = \(totalWeight)")
        print("totalMarginSize = \(totalMarginSize)")
        
        
        if direction == .vertical {
            for view in of.subviews {
                if view.lv.weight > 0 {
                      view.frame.size.height = max((view.lv.weight * (rootViewSize.height - totalMarginSize.height) / totalWeight), 0)
                } else{
                    
                }
                
            }
            
            
        } else {
            
        }
        
        
        
        //        let rootViewSize = CGSize(width: getViewWidth(of), height: getViewHeight(of))
        
        
   
        
        
//                for view in of.subviews {
//                    view.frame.size = CGSize(width:getViewWidth(view), height: getViewHeight(view))
//                    if view.lv.weight > 0 {
//                        switch direction {
//                        case .horizontal:
//                            view.frame.size.width = max((view.lv.weight * (rootViewSize.width - totalMarginSize.width) / totalWeight), 0)
//                            view.lv.width = .pt(view.frame.width)
//                        case .vertical:
//                            view.frame.size.height = max((view.lv.weight * (rootViewSize.height - totalMarginSize.height) / totalWeight), 0)
//                            view.lv.height = .pt(view.frame.height)
//                        }
//                    }
//                    if let layoutView = view as? LayoutView{
//                        layoutView.layoutViewRoot()
//                    }
//                }
        
    }
    
    
    
    //    override func layoutViewRoot() {
    ////        layoutSubviewsSize()
    ////        layoutViewRootFrame()
    ////        layoutSubviewsOrigin()
    //
    //
    //
    //          let rootViewSize = CGSize(width: getViewWidth(viewRoot), height: getViewHeight(viewRoot))
    //          let totalWeight = viewRoot.subviews.reduce(CGFloat(0)) { (value, view) in
    //              view.frame = .zero
    //              return value + view.lv.weight
    //          }
    //          let totalMarginSize = viewRoot.subviews.reduce(CGSize.zero) { (value, view) in
    //              if view.lv.weight > 0 {
    //                  return CGSize(width: value.width + (view.lv.margin * 2 + view.lv.marginLeft + view.lv.marginRight),
    //                                height: value.height + (view.lv.margin * 2 + view.lv.marginTop + view.lv.marginBottom))
    //              } else {
    //                  return CGSize(width: value.width + getViewWidth(view) + (view.lv.margin * 2 + view.lv.marginLeft + view.lv.marginRight),
    //                                height: value.height + getViewHeight(view) + (view.lv.margin * 2 + view.lv.marginTop + view.lv.marginBottom))
    //              }
    //          }
    //          for view in viewRoot.subviews {
    //              view.frame.size = CGSize(width:getViewWidth(view), height: getViewHeight(view))
    //              if view.lv.weight > 0 {
    //                  switch direction {
    //                  case .horizontal:
    //                      view.frame.size.width = max((view.lv.weight * (rootViewSize.width - totalMarginSize.width) / totalWeight), 0)
    //                      view.lv.width = .pt(view.frame.width)
    //                  case .vertical:
    //                      view.frame.size.height = max((view.lv.weight * (rootViewSize.height - totalMarginSize.height) / totalWeight), 0)
    //                      view.lv.height = .pt(view.frame.height)
    //                  }
    //              }
    //              if let layoutView = view as? LayoutView{
    //                  layoutView.layoutViewRoot()
    //              }
    //          }
    //
    //
    //
    //    }
    
    //    override func layoutSubviewsSize() {
    //        guard let viewRoot = self.lv.superviews.reversed().first(where: { return $0.isKind(of: LayoutView.self) }) as? LayoutView  else { return }
    //        let rootViewSize = CGSize(width: getViewWidth(viewRoot), height: getViewHeight(viewRoot))
    //        let totalWeight = viewRoot.subviews.reduce(CGFloat(0)) { (value, view) in
    //            view.frame = .zero
    //            return value + view.lv.weight
    //        }
    //        let totalMarginSize = viewRoot.subviews.reduce(CGSize.zero) { (value, view) in
    //            if view.lv.weight > 0 {
    //                return CGSize(width: value.width + (view.lv.margin * 2 + view.lv.marginLeft + view.lv.marginRight),
    //                              height: value.height + (view.lv.margin * 2 + view.lv.marginTop + view.lv.marginBottom))
    //            } else {
    //                return CGSize(width: value.width + getViewWidth(view) + (view.lv.margin * 2 + view.lv.marginLeft + view.lv.marginRight),
    //                              height: value.height + getViewHeight(view) + (view.lv.margin * 2 + view.lv.marginTop + view.lv.marginBottom))
    //            }
    //        }
    //        for view in viewRoot.subviews {
    //            view.frame.size = CGSize(width:getViewWidth(view), height: getViewHeight(view))
    //            if view.lv.weight > 0 {
    //                switch direction {
    //                case .horizontal:
    //                    view.frame.size.width = max((view.lv.weight * (rootViewSize.width - totalMarginSize.width) / totalWeight), 0)
    //                    view.lv.width = .pt(view.frame.width)
    //                case .vertical:
    //                    view.frame.size.height = max((view.lv.weight * (rootViewSize.height - totalMarginSize.height) / totalWeight), 0)
    //                    view.lv.height = .pt(view.frame.height)
    //                }
    //            }
    //            if let layoutView = view as? LayoutView{
    //                layoutView.layoutViewRoot()
    //            }
    //        }
    //    }
    //
    //    override func layoutSubviewsOrigin() {
    //        var beforeView: UIView?
    //        for view in subviews {
    //            var size = CGSize.zero
    //            if let value = beforeView {
    //                size = CGSize(width: value.frame.maxX + value.lv.margin + value.lv.marginRight, height: value.frame.maxY + value.lv.margin + value.lv.marginBottom)
    //            }
    //            switch direction {
    //            case .horizontal:
    //                view.frame.origin.x = view.lv.margin + view.lv.marginLeft + size.width
    //                switch contentGravity {
    //                case .centerVertical, .center:
    //                    view.frame.origin.y = ((frame.height - view.frame.height) / 2) + (view.lv.marginTop - view.lv.marginBottom)
    //                case .bottom:
    //                    view.frame.origin.y = frame.height - view.frame.height - view.lv.margin - view.lv.marginBottom
    //                default:
    //                    view.frame.origin.y = view.lv.margin + view.lv.marginTop
    //                    break
    //                }
    //                switch view.lv.gravity {
    //                case .center, .centerVertical:
    //                    view.frame.origin.y = ((frame.height - view.frame.height) / 2) + (view.lv.marginTop - view.lv.marginBottom)
    //                case .bottom:
    //                    view.frame.origin.y = frame.height - view.frame.height - view.lv.margin - view.lv.marginBottom
    //                case .top:
    //                    view.frame.origin.y = view.lv.margin + view.lv.marginTop
    //                default:
    //                    break
    //                }
    //            case .vertical:
    //                view.frame.origin.y = view.lv.margin + view.lv.marginTop + size.height
    //                switch contentGravity {
    //                case .centerHorizontal, .center:
    //                    view.frame.origin.x = ((frame.width - view.frame.width) / 2) + (view.lv.marginLeft - view.lv.marginRight)
    //                case .right:
    //                    view.frame.origin.x = frame.width - view.frame.width - view.lv.margin - view.lv.marginRight
    //                default:
    //                    view.frame.origin.x = view.lv.margin + view.lv.marginLeft
    //                    break
    //                }
    //                switch view.lv.gravity {
    //                case .center, .centerHorizontal:
    //                    view.frame.origin.x = ((frame.width - view.frame.width) / 2) + (view.lv.marginLeft - view.lv.marginRight)
    //                case .right:
    //                    view.frame.origin.x = frame.width - view.frame.width - view.lv.margin - view.lv.marginRight
    //                case .left:
    //                    view.frame.origin.x = view.lv.margin + view.lv.marginLeft
    //                default:
    //                    break
    //                }
    //            }
    //            beforeView = view
    //        }
    //        let totalSize = getSubViewsTotalSize(self)
    //        for view in subviews {
    //            switch direction {
    //            case .horizontal:
    //                if contentGravity == .center ||  contentGravity == .centerHorizontal{
    //                    view.frame.origin.x = view.frame.origin.x + (frame.width - totalSize.width) / 2
    //                }
    //            case .vertical:
    //                if contentGravity == .center ||  contentGravity == .centerVertical{
    //                    view.frame.origin.y = view.frame.origin.y + (frame.height - totalSize.height) / 2
    //                }
    //            }
    //        }
    //    }
    //
    //    override func layoutViewRootFrame() {
    //        frame.origin = CGPoint(x: lv.margin + lv.marginLeft, y: lv.margin + lv.marginTop)
    //        frame.size = CGSize(width: getViewWidth(self), height: getViewHeight(self))
    //    }
    //
    //    private func getSubViewsTotalSize(_ from: LinearLayoutView) -> CGSize {
    //        var size = CGSize.zero
    //         for view in from.subviews {
    //              switch from.direction {
    //              case .horizontal:
    //                  size.width += view.frame.width + view.lv.margin * 2 + view.lv.marginLeft + view.lv.marginRight
    //                  size.height = view.frame.maxY + view.lv.margin + view.lv.marginBottom
    //              case .vertical:
    //                  size.height += view.frame.height + view.lv.margin * 2 + view.lv.marginTop + view.lv.marginBottom
    //                  size.width = view.frame.maxX + view.lv.margin + view.lv.marginRight
    //              }
    //          }
    //          return size
    //      }
}

