
//
//  Date+Utility.swift
//  BoiTinh
//
//  Created by Nguyen Duc Hoang on 1/8/17.
//  Copyright © 2017 Nguyen Duc Hoang. All rights reserved.
//

import Foundation
import UIKit

extension Date {
    static func getCurrentYear() -> Int {
        let date = Date()
        let calendar = Calendar.current
        return calendar.component(.year, from: date)
    }
    
    static func getYear(fromDate: Date) -> Int {
        let calendar = Calendar.current
        return calendar.component(.year, from: fromDate)
    }
    
    static func getCurrentMonth() -> Int {
        let date = Date()
        let calendar = Calendar.current
        return calendar.component(.month, from: date)
    }
    
    static func getMonth(fromDate: Date) -> Int {
        let calendar = Calendar.current
        return calendar.component(.month, from: fromDate)
    }
    
    static func getDay(fromDate: Date) -> Int {
        let calendar = Calendar.current
        return calendar.component(.day, from: fromDate)
    }
    
    static func getStringMMddYYYY(day: Int, month: Int, year: Int) -> String {
        let stringDay:String = (day < 10) ? String(format: "0%d", day) : String(format: "%d", day)
        let stringMonth:String = (month < 10) ? String(format: "0%d", month) : String(format: "%d", month)
        let stringYear: String = String(format: "%d", year)
        return String(format: "%@/%@/%@", stringDay, stringMonth, stringYear)
    }
    
    static func getStringMMddYYYY(fromDate: Date) -> String {
        return getStringMMddYYYY(day: Date.getDay(fromDate: fromDate),
                                 month: Date.getMonth(fromDate: fromDate),
                                 year: Date.getYear(fromDate: fromDate))
    }
    
    static func getNextMonth(fromMonth: Int) -> Int {
        if (fromMonth < 12) {
            return fromMonth + 1
        } else {
            return 1
        }
    }
    static func getStringMMDDYYYHHmmss(timestamp: Double) -> String{
        let date = Date.init(timeIntervalSince1970: timestamp)
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        dateFormatter.locale = Locale.current
        return dateFormatter.string(from: date)        
    }
}
