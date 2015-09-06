//
//  SwipeViewControllerUI.swift
//  tinderFonts
//
//  Created by Jonathan Yu on 9/5/15.
//  Copyright (c) 2015 Jonathan Yu. All rights reserved.
//

import Foundation
import UIKit
import Koloda
import pop
import ChameleonFramework
import Facade
import FontBlaster

extension SwipeViewController {
    
//    Called in ViewDidLoad
    func customizeUIElements() {
        
        self.swipeView = KolodaView()
        self.swipeView.delegate = self
        self.swipeView.dataSource = self
        self.view.addSubview(self.swipeView)
        
        generateSwipeButtons()
    }
    
    func generateSwipeButtons() {
//        Uses font awesome
        
        var leftButtonString = String.fontAwesomeString("fa-thumbs-down")
        var leftButtonStringAttributed = NSMutableAttributedString(string: leftButtonString, attributes: [
            NSFontAttributeName: UIFont(name: "HelveticaNeue", size: 11.0)!
            ])
        leftButtonStringAttributed.addAttribute(NSFontAttributeName, value: UIFont.iconFontOfSize("FontAwesome", fontSize: 50.0), range: NSRange(location: 0, length: 1))
        leftButtonStringAttributed.addAttribute(NSForegroundColorAttributeName, value: UIColor.flatBlueColor(), range: NSRange(location: 0, length: 1))
        
        var rightButtonString = String.fontAwesomeString("fa-thumbs-up")
        var rightButtonStringAttributed = NSMutableAttributedString(string: rightButtonString, attributes: [
            NSFontAttributeName: UIFont(name: "HelveticaNeue", size: 11.0)!
            ])
        rightButtonStringAttributed.addAttribute(NSFontAttributeName, value: UIFont.iconFontOfSize("FontAwesome", fontSize: 50.0), range: NSRange(location: 0, length: 1))
        rightButtonStringAttributed.addAttribute(NSForegroundColorAttributeName, value: UIColor.flatBlueColor(), range: NSRange(location: 0, length: 1))
        
        self.rightSwipeButton = UIButton()
        self.rightSwipeButton.setAttributedTitle(rightButtonStringAttributed, forState: UIControlState.Normal)
        self.rightSwipeButton.addTarget(self, action: "rightButtonTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(self.rightSwipeButton)
        
        self.leftSwipeButton = UIButton()
        self.leftSwipeButton.setAttributedTitle(leftButtonStringAttributed, forState: UIControlState.Normal)
        self.leftSwipeButton.addTarget(self, action: "leftButtonTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(self.leftSwipeButton)
    }
    
//    Called in ViewDidLoad
    func layoutFacade() {
        var topBorder: CGFloat = self.navigationController!.navigationBar.frame.height
        var visibleHeight:CGFloat = self.view.frame.height - topBorder
        
        self.swipeView.anchorTopCenterFillingWidthWithLeftAndRightPadding(25.0,topPadding: 50.0 + topBorder, height: visibleHeight * 0.6)
        self.view.groupHorizontally([self.leftSwipeButton, self.rightSwipeButton], centeredUnderView: self.swipeView, topPadding: 30.0, spacing: 75.0, width: 50, height: 35)
        
    }
    
    func leftButtonTapped(target: AnyObject) {
        self.swipeView.swipe(SwipeResultDirection.Left)
    }
    
    func rightButtonTapped(target: AnyObject) {
        self.swipeView.swipe(SwipeResultDirection.Right)
    }
}