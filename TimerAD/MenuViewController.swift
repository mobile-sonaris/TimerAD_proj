//
//  MenuViewController.swift
//  TimerAD
//
//  Created by Hideo on 5/24/16.
//  Copyright © 2016 Designoasis. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var timerBtn: UIButton!
    @IBOutlet weak var profileBtn: UIButton!
    @IBOutlet weak var favouriteBtn: UIButton!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var settingsBtn: UIButton!
    @IBOutlet weak var notificationBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func timerBtnPressed(sender: AnyObject) {
        
        self.performSegueWithIdentifier("toStartSegue", sender: nil)
    }
    

    @IBAction func profileBtnPressed(sender: AnyObject) {
        
        self.performSegueWithIdentifier("toProfileSegue", sender: nil)
        
    }
    @IBAction func favouritesBtnPressed(sender: AnyObject) {
        
        
    }
    
    @IBAction func saveBtnPressed(sender: AnyObject) {
        
        
    }
    
    @IBAction func settingsBtnPressed(sender: AnyObject) {
        
        
    }
    @IBAction func notificationBtnPressed(sender: AnyObject) {
        
        
    }
    
    /*      state preservation / restoration       */
    override func encodeRestorableStateWithCoder(coder: NSCoder) {
        super.encodeRestorableStateWithCoder(coder)
    }
    
    override func decodeRestorableStateWithCoder(coder: NSCoder) {
        super.decodeRestorableStateWithCoder(coder)
    }
    
    
    override func applicationFinishedRestoringState() {
        
    }
    /*      end        */
}
