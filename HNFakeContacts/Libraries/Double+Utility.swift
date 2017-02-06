//
//  Double+Utility.swift
//  KeybankerApp
//
//  Created by Nguyen Duc Hoang on 1/19/17.
//  Copyright © 2017 Nguyen Duc Hoang. All rights reserved.
//

import Foundation
import UIKit

extension Double {
    static func roundAndConvertToString(inputDouble: Double) -> String {
        return String(format: "%1.0f", inputDouble.rounded(.toNearestOrAwayFromZero))
    }
    
    static func roundAndConvertToDotString(inputDouble: Double) -> String {
        let roundedDouble:Double = inputDouble.rounded(.toNearestOrAwayFromZero)
        let formatter = NumberFormatter()
        formatter.groupingSeparator = "."
        formatter.numberStyle = .decimal
        formatter.string(from: NSNumber(value: roundedDouble))
        return formatter.string(from: NSNumber(value: roundedDouble))!
    }
}
