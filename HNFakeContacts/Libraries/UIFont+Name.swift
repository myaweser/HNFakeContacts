//
//  UIFont+Name.swift
//  BoiTinh
//
//  Created by Nguyen Duc Hoang on 1/7/17.
//  Copyright © 2017 Nguyen Duc Hoang. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
    static func fontNoteworthyLight() -> String{
        return "Noteworthy-Light"
    }
    static func fontAwesome() -> String{
        return "FontAwesome"
    }    

    static func fontHelveticaNeue() -> String{
        return "Helvetica Neue"
    }
    
    static func fontHelveticaLight() -> String{
        return "HelveticaNeue-Light"
    }
    
    static func fontHelveticaBold() -> String{
        return "HelveticaNeue-Bold"
    }
    
    static func showAllFonts() {
        for familyName in UIFont.familyNames {
            for fontName in UIFont.fontNames(forFamilyName: familyName) {
                print(String(format: "Font name = %@", fontName))
            }
        }
    }
}
