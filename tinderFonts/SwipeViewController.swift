//
//  SwipeViewController.swift
//  tinderFonts
//
//  Created by Jonathan Yu on 9/1/15.
//  Copyright (c) 2015 Jonathan Yu. All rights reserved.
//

import Foundation
import UIKit
import Koloda
import pop
import ChameleonFramework
import Facade
import FontBlaster
import iAd

class SwipeViewController: UIViewController {
    var cardCount: Int = 15
    var tinderText: String!
    var swipeView: KolodaView!
    var imageView: UICollectionView!
    
    var rightSwipeButton: UIButton!
    var leftSwipeButton: UIButton!
    var downloadButton: UIButton!
    
    var imageCache: [UIImage]!
    var currentImage: UIImage!
    var cards: [Card]!
    var fonts: [String]!
    
    var adView: ADBannerView!
    
    var topBorder: CGFloat!
    var visibleHeight:CGFloat!
    var swipeSize: CGFloat!
    
    convenience init() {
        self.init(tinderText: nil)
    }
    
    init(tinderText: String?) {
        super.init(nibName: nil, bundle: nil)
        self.tinderText = tinderText
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = tinderText
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Cancel, target: self, action: "dismiss")
        self.view.backgroundColor = UIColor.flatSandColor()
        self.canDisplayBannerAds = true
        self.imageCache = []
        self.fonts = []
        self.cards = []
        self.currentImage = UIImage()
        self.navigationController?.navigationBar.barTintColor = UIColor.flatSandColorDark()
        
        topBorder = self.navigationController!.navigationBar.frame.height
        visibleHeight = self.view.frame.height - topBorder
        swipeSize = self.view.width() * 0.85
        
//        FontBlaster.debugEnabled = true
        FontBlaster.blast()
        
        generateCards()
        customizeUIElements()
        setupCollectionView()
        
//        Always call this one last
        layoutFacade()
//        self.swipeView.reloadData()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
//        Encapsulates the image capture code so that it image-captures the first card and sets it as self.currentImage. CurrentImage gets saved to the imageCache if it is swiped right
        setCurrentImage()
    }
    
//    Other Methods
    func dismiss() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func setCurrentImage() {
        UIGraphicsBeginImageContextWithOptions(swipeView.frame.size, false, 1.0)
        swipeView.drawViewHierarchyInRect(swipeView.bounds, afterScreenUpdates: true)
        self.currentImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
}