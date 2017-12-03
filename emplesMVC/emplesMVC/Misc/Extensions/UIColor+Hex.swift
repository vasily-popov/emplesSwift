//
//  UIColor+Hex.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/7/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit

extension UIColor {
    
    static func color(fromHex rgbHex:UInt32, alpha: CGFloat = 1.0) -> UIColor { //0xFFAABB
        
        return UIColor(red: ((CGFloat)((rgbHex & 0xFF0000) >> 16)) / 255.0,
                       green: ((CGFloat)((rgbHex & 0xFF00) >> 8)) / 255.0,
                       blue: ((CGFloat)(rgbHex & 0xFF)) / 255.0,
                       alpha: alpha)
    }
    
    static func color(fromString hexString:String) -> UIColor? { //#AABBCC
        
        guard hexString.count > 0 else { return nil }
        
        var rgbValue :UInt32 = 0
        let scanner = Scanner(string: hexString)
        
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        if scanner.scanHexInt32(&rgbValue) {
            return UIColor.color(fromHex:rgbValue)
        }
        return nil
    }
    
}

