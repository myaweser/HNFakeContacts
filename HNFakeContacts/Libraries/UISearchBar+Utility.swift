//
//  UISearchBar+Utility.swift
//  IntroApp
//
//  Created by Nguyen Duc Hoang on 1/12/17.
//  Copyright © 2017 Nguyen Duc Hoang. All rights reserved.
//

import Foundation
import UIKit

extension UISearchBar {
    func changeFont(newFont: UIFont) {
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).font = newFont
    }
}
