//
//  UIColor+Utitily.swift
//  BoiTinh
//
//  Created by Nguyen Duc Hoang on 12/30/16.
//  Copyright © 2016 Nguyen Duc Hoang. All rights reserved.
//

import Foundation
import UIKit
import CoreImage

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }

    static func appColor() -> UIColor {        
        //return UIColor.colorWithHex(hexString: "79C8A6") //mau nhat
        return UIColor.colorWithHex(hexString: "005c53") //mau dam
    }
    
    static func appLightColor() -> UIColor {
        return UIColor.colorWithHex(hexString: "6fc9b8")
    }
    
    static func appGreyColor() -> UIColor {
        return UIColor.colorWithHex(hexString: "464646")
    }
    
    static func appStatusBarColor() -> UIColor {        
        return UIColor.colorWithHex(hexString: "005c53")
    }
    
    static func templateCellBackgroundColor() -> UIColor {
        return UIColor.colorWithHex(hexString: "2e7650")
    }

    static func appRedColor() -> UIColor {
        return UIColor.rgb(red: 221, green: 75, blue: 78)
    }
    
    static func appPinkColor() -> UIColor {
        return UIColor.rgb(red: 221, green: 106, blue: 143)
    }
    
    static func appFacebookColor() -> UIColor {
        return UIColor.rgb(red: 59, green: 89, blue: 152)
    }
    
    static func appGoogleColor() -> UIColor {
        return UIColor.colorWithHex(hexString: "df4a32")
    }
    
    static func appBrownColor() -> UIColor {
        return UIColor.rgb(red: 87, green: 78, blue: 79)
    }
    
    static func appChampaineColor() -> UIColor {
        return UIColor.rgb(red: 247, green: 228, blue: 211)
    }
    
    static func appSelectedBlueColor() -> UIColor {
        return UIColor.rgb(red: 75, green: 145, blue: 217)
    }
    
    static func colorWithHex(hexString: String) -> UIColor {
        var cString:String = hexString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        if ((cString.characters.count) != 6) {
            return UIColor.gray
        }
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    static func colorToHexString(color: UIColor) -> String {
        let ciColor:CIColor = CIColor(cgColor: color.cgColor)
        return String(format: "#%02lX%02lX%02lX", lroundf(Float(ciColor.red * 255)), lroundf(Float(ciColor.green * 255)), lroundf(Float(ciColor.blue * 255)))
    }
}
