//
//  AlertView.swift
//  BoiTinh
//
//  Created by Nguyen Duc Hoang on 1/8/17.
//  Copyright © 2017 Nguyen Duc Hoang. All rights reserved.
//

import UIKit

protocol AlertViewDelegate {
    func pressOK(alertView: AlertView)
    func pressSaveText(alertView: AlertView, text: String)
    func pressCancel(alertView: AlertView)
}

public enum AppAlertStyle : Int {
    case okButtonOnly
    case okCancelButton
    case yesNoButton
    case updateText
}

class AlertView: UIView, UITextViewDelegate {
    var delegate: AlertViewDelegate?
    var isAutoLayout: Bool?
    var alertStyle: AppAlertStyle?
    
    var backgroundButton: UIButton = {
        var button = UIButton()
        button.titleLabel?.textColor = UIColor.white
        button.backgroundColor = UIColor.black
        button.translatesAutoresizingMaskIntoConstraints = false
        button.alpha = 0
        return button
    }()
    
    var innerView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = UIColor.white
        view.alpha = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var headerView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = UIColor.appColor()
        view.alpha = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var headerViewBottom: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = UIColor.appColor()
        view.alpha = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var headerLabel: UILabel = {
        var label = UILabel()
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.text = String.getAppName()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var titleLabel: UILabel = {
        var label = UILabel()
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.text = ""
        label.numberOfLines = 3
        label.font = UIFont(name: UIFont.fontHelveticaLight(), size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var txtUpdate: UITextView = {
        let textView: UITextView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textColor = UIColor.darkGray
        textView.font = UIFont(name: UIFont.fontHelveticaLight(), size: 15)
        textView.textAlignment = .left
        textView.roundedAndBorder(radius: 5, borderWidth: 1, borderColor: UIColor.lightGray)
        textView.alpha = 0
        return textView
    }()
    
    var okButton: UIButton = {
        var button = UIButton()
        button.titleLabel?.textColor = UIColor.white
        button.backgroundColor = UIColor.appColor()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("OK", for: .normal)
        button.titleLabel?.font = UIFont(name: UIFont.fontHelveticaLight(), size: 16)
        button.setTitleColor(UIColor.white, for: .normal)
        button.alpha = 0
        return button
    }()
    
    var cancelButton: UIButton = {
        var button = UIButton()
        button.titleLabel?.textColor = UIColor.white
        button.backgroundColor = UIColor.red
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Huỷ", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont(name: UIFont.fontHelveticaLight(), size: 16)
        button.alpha = 0
        return button
    }()
    
    private func showAllViews(style: AppAlertStyle) {
        backgroundButton.alpha = 0.5
        innerView.alpha = 1
        headerView.alpha = 1
        headerViewBottom.alpha = 1
        headerLabel.alpha = 1
        titleLabel.alpha = 1
        okButton.alpha = 1
        txtUpdate.alpha = 1
        if(style == .okCancelButton || style == .yesNoButton) {
            cancelButton.alpha = 1
        }
    }
    
    private func hideAllViews() {
        backgroundButton.alpha = 0
        innerView.alpha = 0
        headerView.alpha = 0
        headerViewBottom.alpha = 0
        titleLabel.alpha = 0
        txtUpdate.alpha = 0
        headerLabel.alpha = 0
        okButton.alpha = 0
        cancelButton.alpha = 0
    }
    
    override func draw(_ rect: CGRect) {
        
    }
    func btnOK(sender: AnyObject){
        if(alertStyle == .updateText) {
            if(txtUpdate.text?.isEmpty == true) {
                return
            }
            delegate?.pressSaveText(alertView: self, text: txtUpdate.text!)
            return
        }
        self.delegate?.pressOK(alertView: self)
    }
    
    func btnCancel(sender: AnyObject){
        self.endEditing(true)
        self.delegate?.pressCancel(alertView: self)
    }
    
    private func autoLayout(controllerView: UIView, style: AppAlertStyle) {
        if(isAutoLayout == true) {
            return
        }
        controllerView.layoutACenterB(view1: backgroundButton, view2: controllerView, multiplier: 1)
        backgroundButton.addTarget(self, action: #selector(btnCancel(sender:)), for: .touchUpInside)
        
        controllerView.layoutWithFormat(format: "H:[v0(270)]", views: innerView)
        controllerView.layoutWithFormat(format: "V:[v0(180)]", views: innerView)
        controllerView.layoutCenterX(view1: innerView, view2: controllerView)
        controllerView.layoutCenterY(view1: innerView, view2: controllerView)
        
        controllerView.layoutLeftAToLeftB(view1: headerView, view2: innerView, constant: 0)
        controllerView.layoutRightAToRightB(view1: headerView, view2: innerView, constant: 0)
        controllerView.layoutTopAToTopB(view1: headerView, view2: innerView, constant: 0)
        controllerView.layoutHeight(view: headerView, constant: 40)
        
        controllerView.layoutLeftAToLeftB(view1: headerViewBottom, view2: headerView, constant: 0)
        controllerView.layoutRightAToRightB(view1: headerViewBottom, view2: headerView, constant: 0)
        controllerView.layoutBottomAToBottomB(view1: headerViewBottom, view2: headerView, constant: 0)
        controllerView.layoutHeight(view: headerViewBottom, constant: 20)
        
        controllerView.layoutACenterB(view1: headerLabel, view2: headerView, multiplier: 1)
        
        controllerView.layoutWithFormat(format: "H:[v0(80)]", views: okButton)
        controllerView.layoutWithFormat(format: "V:[v0(40)]", views: okButton)
        
        controllerView.layoutWithFormat(format: "H:[v0(80)]", views: cancelButton)
        controllerView.layoutWithFormat(format: "V:[v0(40)]", views: cancelButton)
        okButton.addTarget(self, action: #selector(btnOK(sender:)), for: .touchUpInside)
        if(style == .okButtonOnly || style == .updateText) {
            controllerView.layoutCenterX(view1: okButton, view2: innerView)
            controllerView.layoutBottomAToBottomB(view1: innerView, view2: okButton, constant: 15)
        } else if(style == .okCancelButton || style == .yesNoButton) {
            controllerView.layoutLeftAToLeftB(view1: okButton, view2: innerView, constant: 20)
            controllerView.layoutRightAToRightB(view1: cancelButton, view2: innerView, constant: -20)
            controllerView.layoutBottomAToBottomB(view1: innerView, view2: okButton, constant: 20)
            controllerView.layoutBottomAToBottomB(view1: innerView, view2: cancelButton, constant: 20)
            cancelButton.addTarget(self, action: #selector(btnCancel(sender:)), for: .touchUpInside)
        }
        if(style == .okCancelButton) {
            okButton.setTitle(String.multilanguage(inputString: "OK"), for: .normal)
        } else if(style == .yesNoButton) {
            okButton.setTitle(String.multilanguage(inputString: "Có"), for: .normal)
            cancelButton.setTitle(String.multilanguage(inputString: "Không"), for: .normal)
        }
        
        controllerView.layoutLeftAToLeftB(view1: style == .updateText ? txtUpdate : titleLabel, view2: innerView, constant: 20)
        controllerView.layoutRightAToRightB(view1: style == .updateText ? txtUpdate : titleLabel, view2: innerView, constant: -20)
        controllerView.layoutWithFormat(format: "V:[v0]-10-[v1]-10-[v2]", views: headerView,style == .updateText ? txtUpdate : titleLabel, okButton)
        
        innerView.roundedAndBorder(radius: 20, borderWidth: 0, borderColor: UIColor.appColor())
        headerView.roundedAndBorder(radius: 20, borderWidth: 0, borderColor: UIColor.appColor())
        txtUpdate.delegate = self
        isAutoLayout = true
    }
    
    public func showAlertView(viewController: UIViewController, alertText: String, style: AppAlertStyle, title: String) {
        titleLabel.text = title.characters.count > 0 ? title : titleLabel.text
        alertStyle = style
        if(alertText.isBlankString()) {
            return
        }
        autoLayout(controllerView: viewController.view, style: style)
        txtUpdate.text = alertText
        titleLabel.text = alertText
        if(style == .updateText) {
            headerLabel.text = title
        }
        self.hideAllViews()
        UIView.animate(withDuration: 0.3, animations: {
            self.showAllViews(style: style)
        }) { (animationResult) in
            
        }
    }
//    Do not delete
//    public func showDefaultAlertView(viewController: BaseViewController, alertText: String, style: AppAlertStyle, title: String) {
//        let alert = UIAlertController(title: Global.appName,
//                                      message: alertText,
//                                      preferredStyle: .alert)
//        if(style == .okCancelButton) {
//            let saveAction = UIAlertAction(title: Global.appName,
//                                           style: .default) {
//                                            [unowned self] action in
//                                            
//            }
//        }
//    }
    public func dismissAlertView(viewController: UIViewController) {
        UIView.animate(withDuration: 0.3, animations: {
            self.hideAllViews()
        }) { (animationResult) in
            self.removeFromSuperview()
        }
    }
    //MARK -- UITextViewDelegate
    
    func textViewDidBeginEditing(_ textView: UITextView) {

    }

    func textViewDidEndEditing(_ textView: UITextView) {
        self.endEditing(true)
    }

}

