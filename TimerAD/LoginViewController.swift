//
//  LoginViewController.swift
//  TimerAD
//
//  Created by Hideo on 5/23/16.
//  Copyright © 2016 Designoasis. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var mainScrollView: UIScrollView!

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        emailField.layer.masksToBounds = true
        emailField.layer.borderColor = UIColor.whiteColor().CGColor
        emailField.layer.borderWidth = 1
        emailField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSForegroundColorAttributeName: UIColor.whiteColor()])
        
        passwordField.layer.masksToBounds = true
        passwordField.layer.borderColor = UIColor.whiteColor().CGColor
        passwordField.layer.borderWidth = 1
        passwordField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSForegroundColorAttributeName: UIColor.whiteColor()])
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    @IBAction func loginBtnPressed(sender: AnyObject) {
        
        self.performSegueWithIdentifier("toStartSegue", sender: nil)
    }
    
    @IBAction func fbBtnPressed(sender: AnyObject) {
        
        
        
    }
    @IBAction func twitterBtnPressed(sender: AnyObject) {
    }
    
    @IBAction func createBtnPressed(sender: AnyObject) {
        
        self.performSegueWithIdentifier("toSignSegue", sender: nil)
    }
    
    /*  textfield delegate */
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        
        return true
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        
        if textField == emailField || textField == passwordField {
            
        }
        return true
    }
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        
        return true
    }
    
    /* textfield delegate end */
}
