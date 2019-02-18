//
//  FlexboxLayoutView.swift
//  FlexboxLayoutView <https://github.com/QiaokeZ/iOS_LayoutView>
//
//  Created by admin on 2019/1/18.
//  Copyright © 2019 zhouqiao. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

import UIKit

enum FlexboxDirection: Int {
    case row
    case rowReverse
    case column
    case columnReverse
}

enum FlexboxWrap: Int {
    case noWrap
    case wrap
    case wrapReverse
}

enum FlexboxJustifyContent: Int {
    case flexStart
    case flexEnd
    case center
    case spaceBetween
    case spaceAround
}

enum FlexboxAlignItems: Int {
    case stretch
    case flexStart
    case flexEnd
    case center
}

enum FlexboxAlignContent: Int {
    case stretch
    case flexStart
    case flexEnd
    case center
    case spaceBetween
    case spaceAround
}

class FlexboxLayoutView: UIView {
    
    private(set) var direction: FlexboxDirection = .row
    private(set) var flexWrap: FlexboxWrap = .noWrap
    private(set) var justifyContent: FlexboxJustifyContent = .flexStart
    private(set) var alignItems: FlexboxAlignItems = .stretch
    private(set) var alignContent: FlexboxAlignContent = .stretch
    
    private override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(direction: FlexboxDirection = .row,  width: LayoutSize = .fill, height: LayoutSize = .fill){
        super.init(frame: .zero)
        self.direction = direction
        self.width = width
        self.height = height
    }
    
    override func willMove(toWindow newWindow: UIWindow?) {
        super.didMoveToWindow()
        if frame == .zero {
            layoutFlexboxView(self)
        }
    }
    
    override func layoutIfNeeded() {
        layoutFlexboxView(self)
    }
}

extension FlexboxLayoutView{
    
    private func layoutFlexboxView(_ from: FlexboxLayoutView) {
    
    }
}
