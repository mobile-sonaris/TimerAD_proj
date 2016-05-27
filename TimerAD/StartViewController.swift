//
//  StartViewController.swift
//  TimerAD
//
//  Created by Hideo on 5/24/16.
//  Copyright © 2016 Designoasis. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var menuItemBtn: UIBarButtonItem!
    
    @IBOutlet weak var viewAllView: UIView!
    @IBOutlet weak var shoppingView: UIView!
    @IBOutlet weak var restaurantView: UIView!
    @IBOutlet weak var fashionVIew: UIView!
    @IBOutlet weak var favouriteView: UIView!
    @IBOutlet weak var spaView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.userInteractionEnabled = true

        setUp()
        
        let viewAllTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(StartViewController.viewAllTapped))
        
        viewAllView.userInteractionEnabled = true
        viewAllView.addGestureRecognizer(viewAllTapGestureRecognizer)
        
        let shoppingTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(StartViewController.shoppingTapped))
        shoppingView.userInteractionEnabled = true
        shoppingView.addGestureRecognizer(shoppingTapGestureRecognizer)
        
        let restaurantTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(StartViewController.restaurantTapped))
        restaurantView.userInteractionEnabled = true
        restaurantView.addGestureRecognizer(restaurantTapGestureRecognizer)
        
        let fashionTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(StartViewController.fashionTapped))
        fashionVIew.userInteractionEnabled = true
        fashionVIew.addGestureRecognizer(fashionTapGestureRecognizer)
        
        let favouriteTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(StartViewController.favouriteTapped))
        favouriteView.userInteractionEnabled = true
        favouriteView.addGestureRecognizer(favouriteTapGestureRecognizer)
        
        let spaTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(StartViewController.spaTapped))
        spaView.userInteractionEnabled = true
        spaView.addGestureRecognizer(spaTapGestureRecognizer)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
    
    func setUp() {
        
        let imageView = UIImageView(image: UIImage(named: "SubLogo"))
        self.navigationItem.titleView = imageView
        
        self.automaticallyAdjustsScrollViewInsets = false
        if self.revealViewController() != nil {
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            self.revealViewController().rearViewRevealWidth = self.view.frame.size.width * 0.7
        }
        
    }
    
    
    @IBAction func menuBtnPressed(sender: AnyObject) {
        
        self.revealViewController().revealToggle(sender)
    }
    
    func viewAllTapped()  {
        
        self.performSegueWithIdentifier("toHomeSegue", sender: 5) // View All index = 5 to View All screen
    }
    
    func shoppingTapped() {
        
        self.performSegueWithIdentifier("toHomeSegue", sender: 1) // Shopping index = 1 to Shopping screen
    }
    
    func restaurantTapped() {
        
        self.performSegueWithIdentifier("toHomeSegue", sender: 0) // Restaurants index = 0 to Restaurants screen
    }
    
    func fashionTapped() {
        
        self.performSegueWithIdentifier("toHomeSegue", sender: 2)  // Fashion index = 2 to Fashion screen
    }
    
    func favouriteTapped() {
        
        self.performSegueWithIdentifier("toHomeSegue", sender: 4)  // Favourites index = 4 to Favourites screen
    }
    
    func spaTapped() {
        
        self.performSegueWithIdentifier("toHomeSegue", sender: 3)  // Spa & Beauty index = 3 to Spa & Beauty screen
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "toHomeSegue" {
            if let homeViewController = segue.destinationViewController as? HomeViewController {
                homeViewController.initIndex = sender as? UInt
            }
        }
    }

}
