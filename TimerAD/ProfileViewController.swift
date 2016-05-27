
//
//  ProfileViewController.swift
//  TimerAD
//
//  Created by Hideo on 5/25/16.
//  Copyright © 2016 Designoasis. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var photoCollectionView: UICollectionView!
    @IBOutlet weak var likeNumber: UILabel!
    @IBOutlet weak var dealNumber: UILabel!
    @IBOutlet weak var reviewNumber: UILabel!
    @IBOutlet weak var photoNumber: UILabel!
    @IBOutlet weak var locationField: UILabel!
    @IBOutlet weak var nameField: UILabel!
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var menuItemBtn: UIBarButtonItem!
    
    /*       test data      */
    
    var dealImages :[String] = ["deal1", "deal2","deal1", "deal2", "deal1"]
    /*         end          */
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUp() {
        
        /*      navigation styling       */
        let imageView = UIImageView(image: UIImage(named: "SubLogo"))
        self.navigationItem.titleView = imageView
        
        /*        end          */
        
        if self.revealViewController() != nil {
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            self.revealViewController().rearViewRevealWidth = self.view.frame.size.width * 0.7
        }
    }
    
    @IBAction func menuItemBtnPressed(sender: AnyObject) {
        
        self.revealViewController().revealToggle(sender)
    }
    
    
    /*      state preservation / restoration       */
    override func encodeRestorableStateWithCoder(coder: NSCoder) {
        super.encodeRestorableStateWithCoder(coder)
    }
    
    override func decodeRestorableStateWithCoder(coder: NSCoder) {
        super.decodeRestorableStateWithCoder(coder)
    }
    
    
    override func applicationFinishedRestoringState() {
        
        setUp()
    }
    /*      end        */
    
    
    /*        collectionview delegate             */
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dealImages.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell: UICollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath)
        let dealImageView = cell.viewWithTag(100) as! UIImageView
        dealImageView.image = UIImage(named: dealImages[indexPath.row])
        cell.backgroundView = UIImageView(image: UIImage(named: "DealPhotoBackground"))
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
}
