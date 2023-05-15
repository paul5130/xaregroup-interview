//
//  Extension+UIColor.swift
//  xaregroup.interview
//
//  Created by Paul Wen on 2023/5/14.
//

import UIKit

extension UIColor{
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat,alpha: CGFloat = 1) -> UIColor{
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
    static func tabbarUnselectColor() -> UIColor{ .rgb(red: 205, green: 205, blue: 205)}
    static func blackBackgroundColor() -> UIColor{ .rgb(red: 47, green: 40, blue: 40)}
    static func grayBackgroundColor() -> UIColor{ .rgb(red: 239, green: 239, blue: 239)}
    static func grayTextColor() -> UIColor{ .rgb(red: 148, green: 147, blue: 147)}
    static func linearGradientColor1() -> UIColor{ .rgb(red: 236, green: 205, blue: 95)}
    static func linearGradientColor2() -> UIColor{ .rgb(red: 197, green: 255, blue: 123)}
}

