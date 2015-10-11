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
        let swipeViewY = (((visibleHeight * 0.85) - swipeSize) / 2.0) + topBorder
        
        self.swipeView = KolodaView()
        self.swipeView.frame = CGRectMake(self.view.width() * 0.075, swipeViewY, swipeSize, swipeSize)
        self.swipeView.delegate = self
        self.swipeView.dataSource = self
        self.view.addSubview(self.swipeView)
        
        generateSwipeButtons()
        createAdBanner()
    }
    
    func generateSwipeButtons() {
//        Uses font awesome
        
        let downloadButtonString = String.fontAwesomeString("fa-download")
        let downloadButtonStringAttributed = NSMutableAttributedString(string: downloadButtonString, attributes: [
            NSFontAttributeName: UIFont(name: "HelveticaNeue", size: 11.0)!
            ])
        downloadButtonStringAttributed.addAttribute(NSFontAttributeName, value: UIFont.iconFontOfSize("FontAwesome", fontSize: 27.0), range: NSRange(location: 0, length: 1))
        downloadButtonStringAttributed.addAttribute(NSForegroundColorAttributeName, value: UIColor.flatBlueColor(), range: NSRange(location: 0, length: 1))

        let disabledDownloadButtonStringAttributed = NSMutableAttributedString(string: downloadButtonString, attributes: [
            NSFontAttributeName: UIFont(name: "HelveticaNeue", size: 35.0)!
            ])
        disabledDownloadButtonStringAttributed.addAttribute(NSFontAttributeName, value: UIFont.iconFontOfSize("FontAwesome", fontSize: 27.0), range: NSRange(location: 0, length: 1))
        disabledDownloadButtonStringAttributed.addAttribute(NSForegroundColorAttributeName, value: UIColor.flatRedColorDark(), range: NSRange(location: 0, length: 1))

//        Created a regular UIButton that becomes the customView of the UIBarbuttonItem
        let navBarWidth = self.navigationController?.navigationBar.width() as CGFloat!
        let navBarHeight: CGFloat = self.navigationController?.navigationBar.height() as CGFloat!
        let button = UIButton(frame: CGRectMake(0, 0, navBarWidth * 0.1, navBarHeight))
        button.setAttributedTitle(disabledDownloadButtonStringAttributed, forState: UIControlState.Disabled)
        button.setAttributedTitle(downloadButtonStringAttributed, forState: UIControlState.Normal)
        button.addTarget(self, action: "downloadButtonTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        self.downloadButton = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItem = self.downloadButton
        self.downloadButton.enabled = false
//        self.view.addSubview(self.downloadButton)
    }
    
//    Called in ViewDidLoad
    func layoutFacade() {

        self.imageView.anchorBottomCenterFillingWidthWithLeftAndRightPadding(10.0, bottomPadding: visibleHeight * 0.1, height: visibleHeight * 0.15)
    }
    
    func downloadButtonTapped(target: AnyObject) {
        Factory.createGif(self.imageCache, loopCount: 5, frameDelay: 1.0) { (data, error) -> Void in
            if data != nil {
//                var view = GifView(gifImage: data, frame: UIApplication.sharedApplication().keyWindow!.frame)
//                UIApplication.sharedApplication().keyWindow!.addSubview(view)
                let gifView = GifView(gifImage: data)
                self.presentViewController(gifView, animated: true, completion: nil)
            }
        }
    }
}