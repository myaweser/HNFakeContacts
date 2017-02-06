//
//  String+Utility.swift
//  FindCar
//
//  Created by Nguyen Duc Hoang on 1/4/17.
//  Copyright © 2017 Nguyen Duc Hoang. All rights reserved.
//

import Foundation
import UIKit

import Contacts
import ContactsUI
import AddressBook
import AddressBookUI

extension String {
    func trimmed() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    func isBlankString() -> Bool {
        return self.trimmed().characters.count == 0
    }
    static func getAppName() -> String {
        return Bundle.main.infoDictionary![kCFBundleNameKey as String] as! String
    }
    
    func getDoubleFromDotSeparatorString() -> Double {
        let finalString:String = self.replacingOccurrences(of: ".", with: "", options: NSString.CompareOptions.literal, range:nil)
        if(finalString.isEmpty == false) {
            return Double(finalString)!
        }
        return 0
    }
    func getHeightOfString(width: CGFloat, font: UIFont) -> CGFloat {
        let rect: CGRect = NSString(string: self).boundingRect(with: CGSize(width: width, height: 1000 ), options: [.usesFontLeading], attributes: [NSFontAttributeName: font], context: nil)
        return rect.size.height
    }
    static func printOut(object: Any...) {
        print(object)
    }
    
    static func getEmailAddressFromCNContact(contact: CNContact) -> String {
        let emailAddress:String = ""
        for eachValue:CNLabeledValue in contact.emailAddresses {
            let stringEmail:String = eachValue.value as String
            if(stringEmail.isValidEmail() == true) {
                return stringEmail
            }
        }
        return emailAddress
    }
    
    static func getFullNameFromCNContact(contact: CNContact) -> String {
        if let fullName = CNContactFormatter.string(from: contact, style: .fullName) {
            return fullName
        }
        return ""        
    }
    
    
}
