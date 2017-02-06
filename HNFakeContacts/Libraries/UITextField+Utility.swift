//
//  UITextField+Utility.swift
//  BoiTinh
//
//  Created by Nguyen Duc Hoang on 1/7/17.
//  Copyright © 2017 Nguyen Duc Hoang. All rights reserved.
//

import Foundation
import UIKit
extension UITextField {
    func setPlaceHolderColor(text: String, color: UIColor) {
        self.attributedPlaceholder = NSAttributedString(string: text, attributes: [NSForegroundColorAttributeName : color])
    }
}
