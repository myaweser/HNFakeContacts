
//
//  HNDatePickerView.swift
//  KeybankerApp
//
//  Created by Nguyen Duc Hoang on 1/17/17.
//  Copyright © 2017 Nguyen Duc Hoang. All rights reserved.
//

import UIKit
protocol HNDatePickerViewDelegate {
    func btnCancelFromDatePicker(datePicker: HNDatePickerView)
    func btnOKFromDatePicker(datePicker: HNDatePickerView)
}
class HNDatePickerView: UIView {
    var isLoadView:Bool?
    var delegate: HNDatePickerViewDelegate?
    public var buttonTextColor:UIColor = UIColor.blue
    var parentView:UIView?
    
    var backgroundButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.black
        button.translatesAutoresizingMaskIntoConstraints = false
        button.alpha = 0
        return button
    }()
    
    var headerView: UILabel = {
        let view = UILabel()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = 0
        return view
    }()
    
    var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.appColor()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = 0
        return view
    }()
    
    
    var btnOK: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.clear
        button.setTitle(String.multilanguage(inputString: "Chọn"), for: .normal)
        button.titleLabel?.font = UIFont(name: UIFont.fontHelveticaBold(), size: UIDevice.getFloatValue(iphone5: 17, iphone6: 17, iphone6P: 17, ipad: 22, ipadPro: 23))
        button.titleLabel?.textAlignment = .center
        button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 15, bottom: 5, right: 15)
        button.contentVerticalAlignment = .fill
        button.setTitleColor(UIColor.appColor(), for: .normal)
        button.alpha = 0
        return button
    }()
    
    var btnCancel: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.clear
        button.setTitle(String.multilanguage(inputString: "Hủy"), for: .normal)
        button.titleLabel?.font = UIFont(name: UIFont.fontHelveticaBold(), size: UIDevice.getFloatValue(iphone5: 17, iphone6: 17, iphone6P: 17, ipad: 22, ipadPro: 23))
        button.titleLabel?.textAlignment = .center
        button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 15, bottom: 5, right: 15)
        button.contentVerticalAlignment = .fill
        button.setTitleColor(UIColor.appColor(), for: .normal)
        button.alpha = 0
        return button
    }()
    
    var datePicker: UIDatePicker = {
        let dp:UIDatePicker = UIDatePicker()
        dp.translatesAutoresizingMaskIntoConstraints = false
        dp.datePickerMode = .date
        dp.backgroundColor = UIColor.white
        dp.alpha = 0
        return dp
    }()
    
    private func hideHNDatePickerView() {
        UIView.animate(withDuration: 0.35, animations: {
            self.hideAllComponents()
        }) { (boolResult) in
            self.backgroundButton.removeFromSuperview()
            self.headerView.removeFromSuperview()
            self.btnOK.removeFromSuperview()
            self.btnCancel.removeFromSuperview()
            self.datePicker.removeFromSuperview()
            self.isLoadView = false
        }
    }
    
    private func hideAllComponents() {
        backgroundButton.alpha = 0
        headerView.alpha = 0
        lineView.alpha = 0
        btnOK.alpha = 0
        btnCancel.alpha = 0
        datePicker.alpha = 0
    }
    private func showAllComponents() {
        backgroundButton.alpha = 0.4
        headerView.alpha = 1
        lineView.alpha = 1
        btnOK.alpha = 1
        btnCancel.alpha = 1
        datePicker.alpha = 1
    }
    
    public func showHNDatePickerView() {
        UIView.animate(withDuration: 0.35, animations: {
            self.showAllComponents()
        }) { (boolResult) in
            
        }
    }
    override func layoutSubviews() {
        
    }
    func btnCancelFromDatePicker() {
        hideAllComponents()
        self.delegate?.btnCancelFromDatePicker(datePicker: self)
    }
    
    func btnOKFromDatePicker() {
        hideAllComponents()
        self.delegate?.btnOKFromDatePicker(datePicker: self)
    }
    
    public func autoLayout(parentView: UIView) {
        if(isLoadView == true) {
            return
        }
        self.parentView = parentView
        parentView.layoutACenterB(view1: backgroundButton, view2: parentView, multiplier: 1)
        backgroundButton.addTarget(self, action: #selector(btnCancelFromDatePicker), for: .touchUpInside)
        parentView.bringSubview(toFront: backgroundButton)
        
        parentView.layoutWithFormat(format: "H:|[v0]|", views: datePicker)
        parentView.layoutWithFormat(format: "H:|[v0]|", views: headerView)
        parentView.layoutWithFormat(format: String(format: "V:[v0(%d)][v1]|",
                                                   UIDevice.getIntValue(iphone5: 50, iphone6: 50, iphone6P: 50, ipad: 70, ipadPro: 70)),
                                    views: headerView,datePicker)
        
        parentView.layoutLeftAToLeftB(view1: btnCancel, view2: headerView, constant: 0)
        parentView.layoutCenterY(view1: btnCancel, view2: headerView)
        parentView.layoutHeightAToHeightB(view1: btnCancel, view2: headerView, multiplier: 1)
        parentView.layoutWidth(view: btnCancel, constant: UIDevice.getFloatValue(iphone5: 100, iphone6: 100, iphone6P: 100, ipad: 130, ipadPro: 130))
        btnCancel.addTarget(self, action: #selector(btnCancelFromDatePicker), for: .touchUpInside)
        
        parentView.layoutRightAToRightB(view1: btnOK, view2: headerView, constant: 0)
        parentView.layoutCenterY(view1: btnOK, view2: headerView)
        parentView.layoutHeightAToHeightB(view1: btnOK, view2: headerView, multiplier: 1)
        parentView.layoutWidth(view: btnOK, constant: UIDevice.getFloatValue(iphone5: 100, iphone6: 100, iphone6P: 100, ipad: 130, ipadPro: 130))
        btnOK.addTarget(self, action: #selector(btnOKFromDatePicker), for: .touchUpInside)
        
        parentView.layoutWithFormat(format: "H:|[v0]|", views: lineView)
        parentView.layoutHeight(view: lineView , constant: 1)
        parentView.layoutBottomAToBottomB(view1: lineView, view2: headerView, constant: 0)
        
        isLoadView = true
    }
}
