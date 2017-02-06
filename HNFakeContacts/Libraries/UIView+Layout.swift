//
//  UIView+Layout.swift
//  BoiTinh
//
//  Created by Nguyen Duc Hoang on 1/3/17.
//  Copyright © 2017 Nguyen Duc Hoang. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    public func layoutACenterB(view1: UIView, view2: UIView, multiplier: CGFloat) {
        self.addSubViewWithCheck(subview: view1)
        self.addSubViewWithCheck(subview: view2)
        self.addConstraint(NSLayoutConstraint(item: view1, attribute: .centerX, relatedBy: .equal, toItem: view2, attribute: .centerX, multiplier:1,constant: 0))
        self.addConstraint(NSLayoutConstraint(item: view1, attribute: .centerY, relatedBy: .equal, toItem: view2, attribute: .centerY, multiplier:1,constant: 0))
        self.addConstraint(NSLayoutConstraint(item: view1, attribute: .width, relatedBy: .equal, toItem: view2, attribute: .width, multiplier: multiplier, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: view1, attribute: .height, relatedBy: .equal, toItem: view2, attribute: .height, multiplier: multiplier, constant: 0))
    }
    
    public func layoutCenterX(view1: UIView, view2: UIView) {
        self.addSubViewWithCheck(subview: view1)
        self.addSubViewWithCheck(subview: view2)
        self.addConstraint(NSLayoutConstraint(item: view1, attribute: .centerX, relatedBy: .equal, toItem: view2, attribute: .centerX, multiplier:1,constant: 0))
    }
    
    public func layoutCenterY(view1: UIView, view2: UIView) {
        self.addSubViewWithCheck(subview: view1)
        self.addSubViewWithCheck(subview: view2)
        self.addConstraint(NSLayoutConstraint(item: view1, attribute: .centerY, relatedBy: .equal, toItem: view2, attribute: .centerY, multiplier:1,constant: 0))
    }
    
    public func layoutCenter(view1: UIView, view2: UIView) {
        self.addSubViewWithCheck(subview: view1)
        self.addSubViewWithCheck(subview: view2)
        self.addConstraint(NSLayoutConstraint(item: view1, attribute: .centerX, relatedBy: .equal, toItem: view2, attribute: .centerX, multiplier:1,constant: 0))
        self.addConstraint(NSLayoutConstraint(item: view1, attribute: .centerY, relatedBy: .equal, toItem: view2, attribute: .centerY, multiplier:1,constant: 0))
    }
    
    public func layoutLeftAToLeftB(view1: UIView, view2: UIView, constant: CGFloat) {
        self.addSubViewWithCheck(subview: view1)
        self.addSubViewWithCheck(subview: view2)
        self.addConstraint(NSLayoutConstraint(item: view1, attribute: .left, relatedBy: .equal, toItem: view2, attribute: .left, multiplier:1,constant: constant))
    }
    
    public func layoutLeftAToRightB(view1: UIView, view2: UIView, constant: CGFloat) {
        self.addSubViewWithCheck(subview: view1)
        self.addSubViewWithCheck(subview: view2)
        self.addConstraint(NSLayoutConstraint(item: view1, attribute: .left, relatedBy: .equal, toItem: view2, attribute: .right, multiplier:1,constant: constant))
    }
    
    public func layoutRightAToRightB(view1: UIView, view2: UIView, constant: CGFloat) {
        self.addSubViewWithCheck(subview: view1)
        self.addSubViewWithCheck(subview: view2)
        self.addConstraint(NSLayoutConstraint(item: view1, attribute: .right, relatedBy: .equal, toItem: view2, attribute: .right, multiplier:1,constant: constant))
    }
    
    public func layoutRightAToLeftB(view1: UIView, view2: UIView, constant: CGFloat) {
        self.addSubViewWithCheck(subview: view1)
        self.addSubViewWithCheck(subview: view2)
        self.addConstraint(NSLayoutConstraint(item: view1, attribute: .right, relatedBy: .equal, toItem: view2, attribute: .left, multiplier:1,constant: constant))
    }
    
    public func layoutTopAToBottomB(view1: UIView, view2: UIView, constant: CGFloat) {
        self.addSubViewWithCheck(subview: view1)
        self.addSubViewWithCheck(subview: view2)
        self.addConstraint(NSLayoutConstraint(item: view1, attribute: .top, relatedBy: .equal, toItem: view2, attribute: .bottom, multiplier:1,constant: constant))
    }
    
    public func layoutBottomAToBottomB(view1: UIView, view2: UIView, constant: CGFloat) {
        self.addSubViewWithCheck(subview: view1)
        self.addSubViewWithCheck(subview: view2)
        self.addConstraint(NSLayoutConstraint(item: view1, attribute: .bottom, relatedBy: .equal, toItem: view2, attribute: .bottom, multiplier:1,constant: constant))
    }
    
    public func layoutTopAToTopB(view1: UIView, view2: UIView, constant: CGFloat) {
        self.addSubViewWithCheck(subview: view1)
        self.addSubViewWithCheck(subview: view2)
        self.addConstraint(NSLayoutConstraint(item: view1, attribute: .top, relatedBy: .equal, toItem: view2, attribute: .top, multiplier:1,constant: constant))
    }
    
    public func layoutWithFormat(format: String, views: UIView...) {
        var j:Int = 0
        var dictParams:[String : UIView] = [:]
        for view:UIView in views {
            self.addSubViewWithCheck(subview: view)
            let key = String(format:"v%d",j)
            dictParams[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
            j = j + 1
        }
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: [], metrics: nil, views: dictParams))
    }
    
    public func layoutWidth(view: UIView, constant: CGFloat) {
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubViewWithCheck(subview: view)
        self.addConstraint(NSLayoutConstraint(item: view, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: constant))
    }
    
    public func layoutWidthAToWidthB(view1: UIView, view2: UIView, multiplier: CGFloat) {
        self.addSubViewWithCheck(subview: view1)
        self.addSubViewWithCheck(subview: view2)
        self.addConstraint(NSLayoutConstraint(item: view1, attribute: .width, relatedBy: .equal, toItem: view2, attribute: .width, multiplier: multiplier, constant: 0))
    }
    
    public func layoutHeight(view: UIView, constant: CGFloat) {
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubViewWithCheck(subview: view)
        self.addConstraint(NSLayoutConstraint(item: view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: constant))
    }
    
    public func layoutHeightAToHeightB(view1: UIView, view2: UIView, multiplier: CGFloat) {
        self.addSubViewWithCheck(subview: view1)
        self.addSubViewWithCheck(subview: view2)
        self.addConstraint(NSLayoutConstraint(item: view1, attribute: .height, relatedBy: .equal, toItem: view2, attribute: .height, multiplier: multiplier, constant: 0))
    }
    
    public func addSubViewWithCheck(subview: UIView) {
        if(!self.subviews .contains(subview) && subview != self) {
            subview.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(subview)
        }
    }
    
    public func layoutRatio(view: UIView, ratio: CGFloat) {
        self.addSubViewWithCheck(subview: view)
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraint(NSLayoutConstraint(item: view, attribute: .width, relatedBy: .equal, toItem: view, attribute: .height, multiplier: ratio, constant: 0))
    }
        
    func roundedAndBorder(radius: CGFloat, borderWidth: CGFloat, borderColor: UIColor) {
        self.layer.cornerRadius = radius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        self.layer.masksToBounds = true
        self.clipsToBounds = true
    }
    
    func setHeight(height: CGFloat) {
        
        var frame: CGRect = self.frame
        frame.size.height = height
        
        self.frame = frame
    }
    
    /**
     Redefines the width of the view
     
     :param: width The new value for the view's width
     */
    func setWidth(width: CGFloat) {
        
        var frame: CGRect = self.frame
        frame.size.width = width
        
        self.frame = frame
    }
    
    /**
     Redefines X position of the view
     
     :param: x The new x-coordinate of the view's origin point
     */
    func setX(x: CGFloat) {
        
        var frame: CGRect = self.frame
        frame.origin.x = x
        
        self.frame = frame
    }
    
    /**
     Redefines Y position of the view
     
     :param: y The new y-coordinate of the view's origin point
     */
    func setY(y: CGFloat) {
        
        var frame: CGRect = self.frame
        frame.origin.y = y
        
        self.frame = frame
    }
}



