
//
//  UITextView+Layout.swift
//  IntroApp
//
//  Created by Nguyen Duc Hoang on 1/12/17.
//  Copyright © 2017 Nguyen Duc Hoang. All rights reserved.
//

import Foundation
import UIKit

extension UITextView {
    func borderWith(borderColor: UIColor, borderWidth: CGFloat, cornerRadius: CGFloat) {
        self.layer.borderColor = borderColor.cgColor;
        self.layer.borderWidth = 1.0;
        self.layer.cornerRadius = 5.0;
    }
}
