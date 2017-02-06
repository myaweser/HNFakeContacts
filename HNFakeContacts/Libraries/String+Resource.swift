//
//  String+Resource.swift
//  FindCar
//
//  Created by Nguyen Duc Hoang on 12/30/16.
//  Copyright © 2016 Nguyen Duc Hoang. All rights reserved.
//

import Foundation
import UIKit

extension String {
    static func iconSettingName() -> String {
        return "icon_setting"
    }
    
    static func imageCarName() -> String {
        return "image_car_vn"
//        return "image_car"
    }
    
    static func iconLocationFinding() -> String {
        return "icon_location_finding"
    }
    
    static func iconCompass() -> String {
        return "icon_compass"
    }
    
    static func iconCompassGrey() -> String {
        return "icon_compass_grey"
    }
    
    static func iconHistory() -> String {
        return "icon_history"
    }
    
    static func iconHistoryGrey() -> String {
        return "icon_history_grey"
    }
    
    
    static func iconLocation() -> String {
        return "icon_location"
    }

    static func iconLocationBlue() -> String {
        return "icon_location_blue"
    }
    
    static func iconLocationBlack() -> String {
        return "icon_location_black"
    }
    
    static func iconBack() -> String {
        return "icon_back"
    }
    
    static func iconFeedbackAndSuggestion() -> String {
        return "icon_feedback_and_suggesstion"
    }    

    static func iconGetFullVersion() -> String {
        return "icon_get_full_version"
    }
    static func iconRateUs() -> String {
        return "icon_rate_us"
    }

    static func iconShareApp() -> String {
        return "icon_share_app"
    }    
    
    static func multilanguage(inputString: String) -> String {
        return NSLocalizedString(inputString, comment: "")
    }
    
    func removeEdgeSpacesInString() -> String {
        return self.trimmingCharacters(in: .whitespaces)
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }    
}
