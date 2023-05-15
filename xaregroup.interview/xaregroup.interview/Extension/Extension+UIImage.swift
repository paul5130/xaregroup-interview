//
//  Extension+UIImage.swift
//  xaregroup.interview
//
//  Created by Paul Wen on 2023/5/14.
//

import UIKit

extension UIImage{
    static func man() -> UIImage{ #imageLiteral(resourceName: "man") }
    static func nikeLogo() -> UIImage{ #imageLiteral(resourceName: "nike_logo") }
    static func nikeShoe() -> UIImage{ #imageLiteral(resourceName: "nike_shoe") }
    static func tabCart() -> UIImage{ #imageLiteral(resourceName: "tab_cart") }
    static func tabHome() -> UIImage{ #imageLiteral(resourceName: "tab_home") }
    static func tabUser() -> UIImage{ #imageLiteral(resourceName: "tab_user") }
    static func tabWallet() -> UIImage{ #imageLiteral(resourceName: "tab_wallet") }
    static func woman() -> UIImage{ #imageLiteral(resourceName: "woman") }
    static func heart() -> UIImage{ #imageLiteral(resourceName: "heart") }
}
extension UIImage{
    func rotate(radians: CGFloat) -> UIImage {
        let rotatedSize = CGRect(origin: .zero, size: size)
            .applying(CGAffineTransform(rotationAngle: CGFloat(radians)))
            .integral.size
        UIGraphicsBeginImageContext(rotatedSize)
        if let context = UIGraphicsGetCurrentContext() {
            let origin = CGPoint(x: rotatedSize.width / 2.0,
                                 y: rotatedSize.height / 2.0)
            context.translateBy(x: origin.x, y: origin.y)
            context.rotate(by: radians)
            draw(in: CGRect(x: -origin.y, y: -origin.x,
                            width: size.width, height: size.height))
            let rotatedImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            return rotatedImage ?? self
        }
        return self
    }
}
