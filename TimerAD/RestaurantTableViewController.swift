//
//  RestaurantTableViewController.swift
//  TimerAD
//
//  Created by Hideo on 5/26/16.
//  Copyright © 2016 Designoasis. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UIViewController {

    @IBOutlet weak var topView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let restaurantListViewController = self.storyboard?.instantiateViewControllerWithIdentifier("RestaurantListViewController")
        self.addChildViewController(restaurantListViewController!)
        self.view.insertSubview((restaurantListViewController?.view)!, belowSubview: topView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
