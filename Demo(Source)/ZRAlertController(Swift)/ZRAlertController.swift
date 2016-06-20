//
//  ZRAlertController.swift
//  ZRAlertController
//
//  Created by Victor John on 6/17/16.
//  Copyright © 2016 com.xiaoruigege. All rights reserved.
//
//  https://github.com/VictorZhang2014/AlertView-Demo-for-iOS
//  An open source library for iOS in Swift that is being compatible with iOS 7.0 and later.
//  Its main function that wrapped UIAlertView and UIAlertController that are easier to call.
//

import Foundation
import UIKit

typealias VoidClosure = (Void) -> Void
typealias VoidOneParamClosure = (textField:UITextField) -> Void
typealias VoidTwoParamClosure = (textField1:UITextField, textField2:UITextField) -> Void

var defaultClosure : VoidClosure? = nil
var cancelClosure : VoidClosure? = nil

var defaultClosure1 : VoidOneParamClosure? = nil
var cancelClosure1 : VoidOneParamClosure? = nil

var defaultClosure2 : VoidTwoParamClosure? = nil
var cancelClosure2 : VoidTwoParamClosure? = nil

private enum ZRAlertType {
    case Default
    case OneTextInput
    case TwoTextInput
}

public class ZRAlertController {
    
    enum ZRAlertStyle {
        case PlainTextInput
        case SecureTextInput
        case LoginAndPasswordInput
    }
    
    private let delegateController: ZRDelegateController = ZRDelegateController()
    
    static var defaultInstance :  ZRAlertController?
    
    static func defaultAlert() -> ZRAlertController {
        if (defaultInstance == nil) {
            defaultInstance = ZRAlertController()
        }
        return defaultInstance!;
    }
    
    func alertShow(controller:UIViewController, title:String, message:String, okayButton:String) -> Void {
        if #available(iOS 8.0, *) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
            let action = UIAlertAction(title: okayButton, style: UIAlertActionStyle.Default, handler: nil)
            alert.addAction(action)
            controller.presentViewController(alert, animated: true, completion: nil)
        } else {
            let alert = UIAlertView(title: title, message: message, delegate: nil, cancelButtonTitle: okayButton)
            alert.show()
        }
    }
    
    func alertShow(controller:UIViewController, title:String, message:String, cancelButton:String, okayButton:String, okHandler okayHandler:() -> (), abolishHandler cancelHandler:() -> ()) -> Void {
        defaultClosure = okayHandler
        cancelClosure = cancelHandler
        if #available(iOS 8.0, *) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
            let action0 = UIAlertAction(title: cancelButton, style: UIAlertActionStyle.Cancel, handler: { (alertAction) in
                cancelHandler()
            })
            let action1 = UIAlertAction(title: okayButton, style: UIAlertActionStyle.Default, handler: { (alertAction) in
                okayHandler()
            })
            alert.addAction(action0)
            alert.addAction(action1)
            controller.presentViewController(alert, animated:true, completion: nil)
        } else {
            self.delegateController.alertType = .Default
            let alert = UIAlertView(title: title, message: message, delegate: self.delegateController, cancelButtonTitle: cancelButton, otherButtonTitles: okayButton)
            alert.show()
            
        }
    }
    
    func alertShow(controller:UIViewController, title:String, message:String, cancelButton:String, okayButton:String, alertStyle:ZRAlertStyle, placeHolder:String, okayHandler:VoidOneParamClosure, cancelHandler:VoidOneParamClosure ) -> Void {
        defaultClosure1 = okayHandler
        cancelClosure1 = cancelHandler
        if #available(iOS 8.0, *) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
            alert.addTextFieldWithConfigurationHandler({ (textField) in
                textField.placeholder = placeHolder
                if alertStyle == .SecureTextInput {
                    textField.secureTextEntry = true
                }
            })
            let action0 = UIAlertAction(title: cancelButton, style: UIAlertActionStyle.Cancel, handler: { (alertAction) in
                cancelHandler(textField: (alert.textFields?.first)!)
            })
            let action1 = UIAlertAction(title: okayButton, style: UIAlertActionStyle.Default, handler: { (alertAction) in
                okayHandler(textField: (alert.textFields?.first)!)
            })
            alert.addAction(action0)
            alert.addAction(action1)
            controller.presentViewController(alert, animated:true, completion: nil)
        } else {
            self.delegateController.alertType = .OneTextInput
            let alert = UIAlertView(title: title, message: message, delegate: self.delegateController, cancelButtonTitle: cancelButton, otherButtonTitles: okayButton)
            if alertStyle == .SecureTextInput {
                alert.alertViewStyle = .SecureTextInput
            } else if alertStyle == .PlainTextInput {
                alert.alertViewStyle = .PlainTextInput
            } else {
                print("The parameter of alertStyle is not correct!")
                return
            }
            alert.textFieldAtIndex(0)!.placeholder = placeHolder
            alert.show()
        }
    }
    
    func alertShow(controller:UIViewController, title:String, message:String, cancelButton:String, okayButton:String, placeHolder1:String, placeHolder2:String, okayHandler:VoidTwoParamClosure, cancelHandler:VoidTwoParamClosure) -> Void {
        defaultClosure2 = okayHandler
        cancelClosure2 = cancelHandler
        if #available(iOS 8.0, *) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
            alert.addTextFieldWithConfigurationHandler({ (textField) in
                textField.placeholder = placeHolder1
            })
            alert.addTextFieldWithConfigurationHandler({ (textField) in
                textField.placeholder = placeHolder2
                textField.secureTextEntry = true
            })
            let action0 = UIAlertAction(title: cancelButton, style: UIAlertActionStyle.Cancel, handler: { (alertAction) in
                cancelHandler(textField1: (alert.textFields?.first)!, textField2: (alert.textFields?.last)!)
            })
            let action1 = UIAlertAction(title: okayButton, style: UIAlertActionStyle.Default, handler: { (alertAction) in
                okayHandler(textField1: (alert.textFields?.first)!, textField2: (alert.textFields?.last)!)
            })
            alert.addAction(action0)
            alert.addAction(action1)
            controller.presentViewController(alert, animated:true, completion: nil)
        } else {
            self.delegateController.alertType = .TwoTextInput
            let alert = UIAlertView(title: title, message: message, delegate: self.delegateController, cancelButtonTitle: cancelButton, otherButtonTitles: okayButton)
            alert.alertViewStyle = .LoginAndPasswordInput
            alert.textFieldAtIndex(0)!.placeholder = placeHolder1
            alert.textFieldAtIndex(1)!.placeholder = placeHolder2
            alert.show()
        }
    }
    
}



private class ZRDelegateController : UIViewController, UIAlertViewDelegate{
    
    var alertType: ZRAlertType?
    
    @objc func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        if buttonIndex == 1 {
            switch alertType! {
            case .Default:
                defaultClosure!()
            case .OneTextInput:
                defaultClosure1!(textField: alertView.textFieldAtIndex(0)!)
            case .TwoTextInput:
                defaultClosure2!(textField1: alertView.textFieldAtIndex(0)!, textField2: alertView.textFieldAtIndex(1)!)
            }
            
        } else {
            switch alertType! {
            case .Default:
                cancelClosure!()
            case .OneTextInput:
                cancelClosure1!(textField: alertView.textFieldAtIndex(0)!)
            case .TwoTextInput:
                cancelClosure2!(textField1: alertView.textFieldAtIndex(0)!, textField2: alertView.textFieldAtIndex(1)!)
            }
        }
    }
}








