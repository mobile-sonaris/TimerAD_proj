//
//  HomeViewController.swift
//  TimerAD
//
//  Created by Hideo on 5/24/16.
//  Copyright © 2016 Designoasis. All rights reserved.
//

import UIKit
import CarbonKit

class HomeViewController: UIViewController, CarbonTabSwipeNavigationDelegate {
    
    var initIndex: UInt!
    var indicatorStatus: Bool!
    
    var carbonTapSwipeNavigation : CarbonTabSwipeNavigation!

    @IBOutlet weak var mapIndicatorBtn: UIBarButtonItem!
    @IBOutlet weak var menuItemBtn: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUp() {
        /*       navigation styling        */
        let imageView = UIImageView(image: UIImage(named: "SubLogo"))
        self.navigationItem.titleView = imageView
        indicatorStatus = true
        /*            end                  */
        
        self.automaticallyAdjustsScrollViewInsets = false
        if self.revealViewController() != nil {
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            self.revealViewController().rearViewRevealWidth = self.view.frame.size.width * 0.7
        }
        
        /*  CarbonKit Swipe Navigation initialization and Styling */
        
        let items = ["Restaurants", "Shopping", "Fashion", "Spa & Beauty", "My Favourites", "All"]
        carbonTapSwipeNavigation = CarbonTabSwipeNavigation(items: items, delegate: self)
        carbonTapSwipeNavigation.insertIntoRootViewController(self)
        carbonTapSwipeNavigation.setCurrentTabIndex(initIndex, withAnimation: true)
        
        style()
        
        /*                end                                     */
    }
    
    @IBAction func menuItemBtnPressed(sender: AnyObject) {
        
        self.revealViewController().revealToggle(sender)
    }
    
    @IBAction func mapIndicatorBtnPressed(sender: AnyObject) {
        
        containerTransition(carbonTapSwipeNavigation.currentTabIndex)
    }
    
    
    func containerTransition(index: UInt)  {
        
        switch index {
        case 0:
            let currentViewController = carbonTapSwipeNavigation.viewControllers[index] as! RestaurantViewController
            let restaurantMapViewController : UIViewController = (self.storyboard?.instantiateViewControllerWithIdentifier("RestaurantMapViewController"))!
            let restaurantTableViewController : UIViewController = (self.storyboard?.instantiateViewControllerWithIdentifier("RestaurantTableViewController"))!
            
            if indicatorStatus == true {
                
                restaurantMapViewController.view.translatesAutoresizingMaskIntoConstraints = false
                currentViewController.cycleFromViewController(currentViewController.currentViewController, toViewController: restaurantMapViewController)
                currentViewController.currentViewController = restaurantMapViewController
                
                mapIndicatorBtn.image = UIImage(named: "TableIndicator")
                indicatorStatus = false
                currentViewController.currentViewState = indicatorStatus
                
            }else {
                restaurantTableViewController.view.translatesAutoresizingMaskIntoConstraints = false
                currentViewController.cycleFromViewController(currentViewController.currentViewController, toViewController: restaurantTableViewController)
                currentViewController.currentViewController = restaurantTableViewController
                
                mapIndicatorBtn.image = UIImage(named: "MapIndicator")
                indicatorStatus = true
                currentViewController.currentViewState = indicatorStatus
            }
        case 4:
            
            let currentViewController = carbonTapSwipeNavigation.viewControllers[index] as! FavouritesViewController
            let favouritesMapViewController : UIViewController = (self.storyboard?.instantiateViewControllerWithIdentifier("FavouritesMapViewController"))!
            let favouritesTableViewController : UIViewController = (self.storyboard?.instantiateViewControllerWithIdentifier("FavouritesTableViewController"))!
            
            if indicatorStatus == true {
                
                favouritesMapViewController.view.translatesAutoresizingMaskIntoConstraints = false
                currentViewController.cycleFromViewController(currentViewController.currentViewController, toViewController: favouritesMapViewController)
                currentViewController.currentViewController = favouritesMapViewController
                
                mapIndicatorBtn.image = UIImage(named: "TableIndicator")
                indicatorStatus = false
                currentViewController.currentViewState = indicatorStatus
                
            }else {
                favouritesTableViewController.view.translatesAutoresizingMaskIntoConstraints = false
                currentViewController.cycleFromViewController(currentViewController.currentViewController, toViewController: favouritesTableViewController)
                currentViewController.currentViewController = favouritesTableViewController
                
                mapIndicatorBtn.image = UIImage(named: "MapIndicator")
                indicatorStatus = true
                
                currentViewController.currentViewState = indicatorStatus
            }

        default:
            break
        }
    }
    
    
    func style() {
        
        
        carbonTapSwipeNavigation.toolbar.translucent = false
        carbonTapSwipeNavigation.setIndicatorColor(UIColor.init(red: 68/255, green: 177/255, blue: 220/225, alpha: 1.0))
        carbonTapSwipeNavigation.setTabExtraWidth(30)
        carbonTapSwipeNavigation.setNormalColor(UIColor.blackColor(), font: UIFont.boldSystemFontOfSize(16))
        carbonTapSwipeNavigation.setSelectedColor(UIColor.init(red: 68/255, green: 177/255, blue: 220/255, alpha: 1.0), font: UIFont.boldSystemFontOfSize(20))
        
        /*      swipe gesture disable  in CarbonTapSwipeNavigation       */
        
        
        /*                              end                              */
    }
    
    func carbonTabSwipeNavigation(carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAtIndex index: UInt) -> UIViewController {
        
        switch index {
        case 0:
            let restaurantViewController : RestaurantViewController = self.storyboard?.instantiateViewControllerWithIdentifier("RestaurantViewController") as! RestaurantViewController
            restaurantViewController.currentViewState = indicatorStatus
            return restaurantViewController
        case 1:
            return (self.storyboard?.instantiateViewControllerWithIdentifier("ShoppingViewController"))!
        case 2:
            return (self.storyboard?.instantiateViewControllerWithIdentifier("FashionViewController"))!
        case 3:
            return (self.storyboard?.instantiateViewControllerWithIdentifier("SpaViewController"))!
        case 4:
            let favouritesViewController: FavouritesViewController = self.storyboard?.instantiateViewControllerWithIdentifier("FavouritesViewController") as! FavouritesViewController
            favouritesViewController.currentViewState = indicatorStatus
            return favouritesViewController
        case 5:
            return (self.storyboard?.instantiateViewControllerWithIdentifier("AllViewController"))!
        default:
            return (self.storyboard?.instantiateViewControllerWithIdentifier("AllViewController"))!
        }
    }
    
    func carbonTabSwipeNavigation(carbonTabSwipeNavigation: CarbonTabSwipeNavigation, willMoveAtIndex index: UInt) {
        
        
    }
    
    func carbonTabSwipeNavigation(carbonTabSwipeNavigation: CarbonTabSwipeNavigation, didMoveAtIndex index: UInt) {
        
        switch index {
        case 0:
            let currentViewController = carbonTabSwipeNavigation.viewControllers[index] as! RestaurantViewController
            let restaurantMapViewController : UIViewController = (self.storyboard?.instantiateViewControllerWithIdentifier("RestaurantMapViewController"))!
            let restaurantTableViewController : UIViewController = (self.storyboard?.instantiateViewControllerWithIdentifier("RestaurantTableViewController"))!
            
            if indicatorStatus == true {
                
                restaurantTableViewController.view.translatesAutoresizingMaskIntoConstraints = false
                currentViewController.cycleFromViewController(currentViewController.currentViewController, toViewController: restaurantTableViewController)
                currentViewController.currentViewController = restaurantTableViewController
                
            }else {
                
                restaurantMapViewController.view.translatesAutoresizingMaskIntoConstraints = false
                currentViewController.cycleFromViewController(currentViewController.currentViewController, toViewController: restaurantMapViewController)
                currentViewController.currentViewController = restaurantMapViewController
                
            }
        case 4:
            
            let currentViewController = carbonTabSwipeNavigation.viewControllers[index] as! FavouritesViewController
            let favouritesMapViewController : UIViewController = (self.storyboard?.instantiateViewControllerWithIdentifier("FavouritesMapViewController"))!
            let favouritesTableViewController : UIViewController = (self.storyboard?.instantiateViewControllerWithIdentifier("FavouritesTableViewController"))!
            
            if indicatorStatus == true {
                
                favouritesTableViewController.view.translatesAutoresizingMaskIntoConstraints = false
                currentViewController.cycleFromViewController(currentViewController.currentViewController, toViewController: favouritesTableViewController)
                currentViewController.currentViewController = favouritesTableViewController
                
            }else {
                
                favouritesMapViewController.view.translatesAutoresizingMaskIntoConstraints = false
                currentViewController.cycleFromViewController(currentViewController.currentViewController, toViewController: favouritesMapViewController)
                currentViewController.currentViewController = favouritesMapViewController
            }
            
        default:
            break
        }

        
    }
    
    func barPositionForCarbonTabSwipeNavigation(carbonTabSwipeNavigation: CarbonTabSwipeNavigation) -> UIBarPosition {
        return UIBarPosition.Top
    }
    
    /*   state preservation / restoration      */
    override func encodeRestorableStateWithCoder(coder: NSCoder) {
        super.encodeRestorableStateWithCoder(coder)
    }
    
    override func decodeRestorableStateWithCoder(coder: NSCoder) {
        super.decodeRestorableStateWithCoder(coder)
    }
    
    override func applicationFinishedRestoringState() {
        setUp()
    }
    
    /*     end         */
}
