//
//  HexaToUIColor.swift
//  MetroSQLiteSwift
//
//  Created by Jesus on 28/1/18.
//  Copyright © 2018 Jesus. All rights reserved.
//

import UIKit

class HexToUIColor: NSObject {
    
    class func convertColor(hex: String) -> UIColor {
        var cString:String = hex
        if (cString.hasPrefix("#")) {
            cString = ((cString as NSString).substring(from: 3) as
                NSString).substring(to: 6)
        }
        if (cString.count != 6) {
            return UIColor.gray
        } else {
            let rString = (cString as NSString).substring(to: 2)
            let gString = ((cString as NSString).substring(from: 2) as
                NSString).substring(to: 2)
            let bString = ((cString as NSString).substring(from: 4) as
                NSString).substring(to: 2)
            var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
            Scanner(string: rString).scanHexInt32(&r)
            Scanner(string: gString).scanHexInt32(&g)
            Scanner(string: bString).scanHexInt32(&b)
            
            return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue:
                CGFloat(b) / 255.0, alpha: CGFloat(1))
        }

    }

}
