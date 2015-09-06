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

class SwipeViewController: UIViewController {
    var cardCount: Int = 15
    var tinderText: String!
    var swipeView: KolodaView!
    
    var rightSwipeButton: UIButton!
    var leftSwipeButton: UIButton!
    
    convenience init() {
        self.init(tinderText: nil)
    }
    
    init(tinderText: String?) {
        super.init(nibName: nil, bundle: nil)
        self.tinderText = tinderText
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = tinderText
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Cancel, target: self, action: "dismiss")
        self.view.backgroundColor = UIColor(gradientStyle: UIGradientStyle.TopToBottom, withFrame: self.view.frame, andColors: [UIColor.flatGrayColor(), RandomFlatColorWithShade(.Dark)])
        FontBlaster.debugEnabled = true
        FontBlaster.blast()
        
        customizeUIElements()
        layoutFacade()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.swipeView.reloadData()
    }
    
//    Other Methods
    func dismiss() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}