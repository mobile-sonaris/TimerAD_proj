//
//  SignViewController.swift
//  TimerAD
//
//  Created by Hideo on 5/23/16.
//  Copyright © 2016 Designoasis. All rights reserved.
//

import UIKit

class SignViewController: UIViewController, UITextFieldDelegate, UIActionSheetDelegate {
    
    
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var nameField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUp() {
        
        let imageView = UIImageView(image: UIImage(named: "SubLogo"))
        self.navigationItem.titleView = imageView
        //self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "LeftArrow")
        //self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "LeftArrow")
        //self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
        
        emailField.layer.masksToBounds = true
        emailField.layer.borderColor = UIColor.whiteColor().CGColor
        emailField.layer.borderWidth = 1
        emailField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSForegroundColorAttributeName: UIColor.whiteColor()])
        
        nameField.layer.masksToBounds = true
        nameField.layer.borderColor = UIColor.whiteColor().CGColor
        nameField.layer.borderWidth = 1
        nameField.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [NSForegroundColorAttributeName: UIColor.whiteColor()])
        
        passwordField.layer.masksToBounds = true
        passwordField.layer.borderColor = UIColor.whiteColor().CGColor
        passwordField.layer.borderWidth = 1
        passwordField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSForegroundColorAttributeName: UIColor.whiteColor()])
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SignViewController.photoTapped))
        photoView.userInteractionEnabled = true
        photoView.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        nameField.resignFirstResponder()
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        
        return true
    }
    
    @IBAction func clearBtnPressed(sender: AnyObject) {
        
        nameField.text = ""
        passwordField.text = ""
        emailField.text = ""
        
    }
    
    @IBAction func registerBtnPressed(sender: AnyObject) {
        
    }
    
    func photoTapped() {
        
        let actionSheet = UIActionSheet(title: nil, delegate: self, cancelButtonTitle: "Cancel", destructiveButtonTitle: nil, otherButtonTitles: "Take Photo", "Photo Library")
        actionSheet.showInView(self.view)
    }
    
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        
        switch buttonIndex {
        case 1:
            NSLog("take photo")
        case 2:
            NSLog("photo library")
        default:
            break
        }
    }
    
}
