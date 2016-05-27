//
//  RestaurantViewController.swift
//  TimerAD
//
//  Created by Hideo on 5/26/16.
//  Copyright © 2016 Designoasis. All rights reserved.
//

import UIKit

class RestaurantViewController: UIViewController {
    

    @IBOutlet weak var containerView: UIView!
    
    weak var currentViewController : UIViewController!
    var currentViewState: Bool!
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        
        /*          subview transition                  */
        if currentViewState == true {
            
            self.currentViewController = self.storyboard?.instantiateViewControllerWithIdentifier("RestaurantTableViewController")
        }else {
            self.currentViewController = self.storyboard?.instantiateViewControllerWithIdentifier("RestaurantMapViewController")
        }
        
        self.currentViewController.view.translatesAutoresizingMaskIntoConstraints = false
        self.addChildViewController(self.currentViewController)
        self.addSubView(self.currentViewController.view, toView: self.containerView)
        
        /*                  end                       */
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*               subview transition animation             */
    
    func addSubView(subView: UIView, toView parentView: UIView) {
        
        parentView.addSubview(subView)
        var viewBindingsDict = [String: AnyObject]()
        viewBindingsDict["subView"] = subView
        parentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[subView]|",
            options: [], metrics: nil, views: viewBindingsDict))
        parentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[subView]|",
            options: [], metrics: nil, views: viewBindingsDict))
        
    }
    
    func cycleFromViewController(oldVC: UIViewController, toViewController newVC: UIViewController) {
        
        oldVC.willMoveToParentViewController(nil)
        self.addChildViewController(newVC)
        
        self.addSubView(newVC.view, toView: self.containerView)
        newVC.view.alpha = 0
        newVC.view.layoutIfNeeded()
        UIView.animateWithDuration(0.5, animations: {
            newVC.view.alpha = 1
            oldVC.view.alpha = 0
            },
            completion: {
                finished in
                oldVC.view.removeFromSuperview()
                oldVC.removeFromParentViewController()
                newVC.didMoveToParentViewController(self)
        })
    }
    
    
    /*               end               */
    
}
