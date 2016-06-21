//
//  ViewController.swift
//  ZRAlertController(Swift)
//
//  Created by Victor John on 6/17/16.
//  Copyright © 2016 XiaoRuiGeGe. All rights reserved.
//
//  https://github.com/VictorZhang2014/ZRAlertController
//  An open source library for iOS in Swift that is being compatible with iOS 7.0 and later.
//  Its main function that wrapped UIAlertView and UIAlertController that are easier to call.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func firstButton(sender: AnyObject) {
        ZRAlertController.defaultAlert().alertShow(self, title: "Note", message: "This is an empty message!", okayButton: "Ok") { () in
            print("This is an call back.")
        };
    }
    
    @IBAction func secondButton(sender: AnyObject) {
        ZRAlertController.defaultAlert().alertShow(self, title: "Note", message: "This is an empty message!", cancelButton: "Cancel", okayButton: "Ok", okHandler: {
            print("You clicked Ok button!")
            }, abolishHandler:{
                print("You clicked Cancel button!")
        })
    }
    
    @IBAction func thirdButton(sender: AnyObject) {
        ZRAlertController.defaultAlert().alertShow(self, title: "Note", message: "This is an empty message, type a character.", cancelButton: "Cancel", okayButton: "Ok", alertStyle: .SecureTextInput, placeHolder: "Type any character", okayHandler: { (textField) in
            print("Your Ok typed is \(textField.text!)")
        }) { (textField) in
            print("Your Cancel typed is \(textField.text!)")
        }
    }
    
    @IBAction func fourthutton(sender: AnyObject) { 
        ZRAlertController.defaultAlert().alertShow(self, title: "Note", message: "This is an empty message, type an account and passcode.", cancelButton: "Cancel", okayButton: "Ok", placeHolder1: "Type an account", placeHolder2: "Type an passcode", okayHandler: { (textField1, textField2) in
            print("Your Ok textField1.text: \(textField1.text!), textField2.text: \(textField2.text!)")
        }) { (textField1, textField2) in
            print("Your Cancel textField1.text: \(textField1.text!), textField2.text: \(textField2.text!)")
        }
    }
    
    
}

