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
        let topBorder: CGFloat = self.navigationController!.navigationBar.frame.height
        let swipeSize: CGFloat = self.view.width() * 0.85
        
        self.swipeView = KolodaView()
        self.swipeView.frame = CGRectMake(self.view.width() * 0.075, topBorder + 50, swipeSize, swipeSize)
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
        downloadButtonStringAttributed.addAttribute(NSFontAttributeName, value: UIFont.iconFontOfSize("FontAwesome", fontSize: 50.0), range: NSRange(location: 0, length: 1))
        downloadButtonStringAttributed.addAttribute(NSForegroundColorAttributeName, value: UIColor.flatBlueColor(), range: NSRange(location: 0, length: 1))

        let disabledDownloadButtonStringAttributed = NSMutableAttributedString(string: downloadButtonString, attributes: [
            NSFontAttributeName: UIFont(name: "HelveticaNeue", size: 11.0)!
            ])
        disabledDownloadButtonStringAttributed.addAttribute(NSFontAttributeName, value: UIFont.iconFontOfSize("FontAwesome", fontSize: 50.0), range: NSRange(location: 0, length: 1))
        disabledDownloadButtonStringAttributed.addAttribute(NSForegroundColorAttributeName, value: UIColor.flatRedColorDark(), range: NSRange(location: 0, length: 1))

        
        self.downloadButton = UIButton()
        self.downloadButton.setAttributedTitle(downloadButtonStringAttributed, forState: UIControlState.Normal)
        self.downloadButton.setAttributedTitle(disabledDownloadButtonStringAttributed, forState: UIControlState.Disabled)
        self.downloadButton.addTarget(self, action: "downloadButtonTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        self.downloadButton.enabled = false
        self.view.addSubview(self.downloadButton)
    }
    
//    Called in ViewDidLoad
    func layoutFacade() {

        self.imageView.anchorBottomCenterFillingWidthWithLeftAndRightPadding(10.0, bottomPadding: visibleHeight * 0.1, height: visibleHeight * 0.15)
        self.downloadButton.alignUnder(self.swipeView, matchingCenterWithTopPadding: visibleHeight * 0.05, width: 50, height: 35)
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