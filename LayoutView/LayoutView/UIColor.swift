//
//  UIColor.swift
//  EasyCharging
//
//  Created by admin on 2018/9/17.
//  Copyright © 2018年 easycharging. All rights reserved.
//

import UIKit

extension UIColor {

    static var random: UIColor {
        let red = CGFloat(arc4random() % 256) / 255.0
        let green = CGFloat(arc4random() % 256) / 255.0
        let blue = CGFloat(arc4random() % 256) / 255.0
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }

    static func rgbaHex(rgb: Int, alpha: CGFloat = 1) -> UIColor {
        return UIColor(red: ((CGFloat)((rgb & 0xFF0000) >> 16)) / 255.0,
            green: ((CGFloat)((rgb & 0xFF00) >> 8)) / 255.0,
            blue: ((CGFloat)(rgb & 0xFF)) / 255.0,
            alpha: alpha)
    }
}
