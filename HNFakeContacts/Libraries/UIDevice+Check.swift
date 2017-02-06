//
//  UIDevice+Check.swift
//  FindCar
//
//  Created by Nguyen Duc Hoang on 12/31/16.
//  Copyright © 2016 Nguyen Duc Hoang. All rights reserved.
//

import Foundation
import UIKit

extension UIDevice {
    struct ScreenSize {
        static let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
        static let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
        static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
        static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    }
    
    static func isIPad() -> Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
    
    static func isNormalIPad() -> Bool {
        return UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1024.0
    }
    
    static func isIPadPro() -> Bool {
        return UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1366.0
    }
    
    static func isIPhone() -> Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }
    static func isIPhone4OrLess() -> Bool {
        return UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
    }
    
    static func isIPhone5() -> Bool {
        return UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
    }
    static func isIPhone6() -> Bool {
        return UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
    }
    static func isIPhone6Plus() -> Bool {
        return UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
    }
    
    static func getFloatValue(iphone5: CGFloat, iphone6: CGFloat, iphone6P: CGFloat, ipad: CGFloat, ipadPro: CGFloat) -> CGFloat {
        if(UIDevice.isIPhone5()) {
            return iphone5
        } else if(UIDevice.isIPhone6()) {
            return iphone6
        } else if(UIDevice.isIPhone6Plus()) {
            return iphone6P
        } else if(UIDevice.isIPad()) {
            return ipad
        } else if(UIDevice.isIPadPro()) {
            return ipadPro
        }
        return 0
    }
    static func getIntValue(iphone5: Int, iphone6: Int, iphone6P: Int, ipad: Int, ipadPro: Int) -> Int {
        if(UIDevice.isIPhone5()) {
            return iphone5
        } else if(UIDevice.isIPhone6()) {
            return iphone6
        } else if(UIDevice.isIPhone6Plus()) {
            return iphone6P
        } else if(UIDevice.isIPad()) {
            return ipad
        } else if(UIDevice.isIPadPro()) {
            return ipadPro
        }
        return 0
    }
    
    static func getStringValue(iphone5: String, iphone6: String, iphone6P: String, ipad: String, ipadPro: String) -> String {
        if(UIDevice.isIPhone5()) {
            return iphone5
        } else if(UIDevice.isIPhone6()) {
            return iphone6
        } else if(UIDevice.isIPhone6Plus()) {
            return iphone6P
        } else if(UIDevice.isIPad()) {
            return ipad
        } else if(UIDevice.isIPadPro()) {
            return ipadPro
        }
        return ""
    }
}
