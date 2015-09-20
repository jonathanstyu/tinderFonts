//
//  ImageViewController.swift
//  tinderFonts
//
//  Created by Jonathan Yu on 9/9/15.
//  Copyright (c) 2015 Jonathan Yu. All rights reserved.
//

import Foundation
import UIKit
import Facade
import pop

class GifView: UIViewController, UIGestureRecognizerDelegate {
    var gifData: UIImage!
    var visualbg: UIVisualEffectView!
    var imageView: UIImageView!
    var shareButton: UIButton!
    
    init(gifImage: NSData?) {
        super.init(nibName: nil, bundle: nil)
        self.gifData = UIImage.animatedImageWithData(gifImage!)
        
        createUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func createUI() {
        
        imageView = UIImageView()
        imageView.image = gifData
        imageView.contentMode = UIViewContentMode.ScaleAspectFit
        imageView.frame = CGRectMake(0, 0, 300, 300)
        
        let popImageViewAnimation = POPBasicAnimation()
        popImageViewAnimation.property = POPAnimatableProperty.propertyWithName(kPOPViewCenter) as! POPAnimatableProperty
        popImageViewAnimation.toValue = NSValue(CGPoint: self.view.center)
        popImageViewAnimation.delegate = self
        imageView.pop_addAnimation(popImageViewAnimation, forKey: "popImage")
        
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        visualbg = UIVisualEffectView(effect: blurEffect)
        visualbg.frame = self.view.frame
        
        let dismissGesture = UITapGestureRecognizer(target: self, action: "dismissView:")
        dismissGesture.delegate = self
        visualbg.addGestureRecognizer(dismissGesture)
        
        let shareButtonString = String.fontAwesomeString("fa-share-square-o")
        let shareButtonStringAttributed = NSMutableAttributedString(string: shareButtonString, attributes: [
            NSFontAttributeName: UIFont(name: "HelveticaNeue", size: 11.0)!
            ])
        shareButtonStringAttributed.addAttribute(NSFontAttributeName, value: UIFont.iconFontOfSize("FontAwesome", fontSize: 50.0), range: NSRange(location: 0, length: 1))
        shareButtonStringAttributed.addAttribute(NSForegroundColorAttributeName, value: UIColor.flatBlueColor(), range: NSRange(location: 0, length: 1))
        
        self.shareButton = UIButton()
        self.shareButton.setAttributedTitle(shareButtonStringAttributed, forState: UIControlState.Normal)
        self.shareButton.addTarget(self, action: "shareObject:", forControlEvents: UIControlEvents.TouchUpInside)
        
        
        self.view.addSubview(visualbg)
        self.view.addSubview(imageView)
        self.view.addSubview(shareButton)
        
        shareButton.anchorBottomCenterWithBottomPadding(35, width: 50, height: 50)
    }    
    
    func dismissView(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func shareObject(sender: AnyObject) {
        let shareController = UIActivityViewController(activityItems: [gifData], applicationActivities: nil)
        self.presentViewController(shareController, animated: true, completion: nil)
    }
    
}