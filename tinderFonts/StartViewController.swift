//
//  ViewController.swift
//  tinderFonts
//
//  Created by Jonathan Yu on 8/31/15.
//  Copyright (c) 2015 Jonathan Yu. All rights reserved.
//

import UIKit
import ChameleonFramework
import pop
import FontBlaster

class StartViewController: UIViewController {
    var textPrompt: UITextField!
    var isPresenting: Bool!
    var animationDuration: NSTimeInterval = 0.3

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Hello There"
        FontBlaster.blast()
        setBackground()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    
        promptForText()
    }

    
    func promptForText() {
        let containerView = UIView()
        containerView.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
        containerView.layer.borderColor = UIColor.randomFlatColor().CGColor
        containerView.layer.borderWidth = 3.0
        containerView.layer.cornerRadius = 10.0
        containerView.clipsToBounds = true

        self.view.addSubview(containerView)
        
        let textLabel = UILabel()
        textLabel.textAlignment = NSTextAlignment.Center
        textLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        textLabel.numberOfLines = 0
        textLabel.text = "A Bunch of fonts. Animated. Colored."
        textLabel.adjustsFontSizeToFitWidth = true
        textLabel.minimumScaleFactor = 0.1
        containerView.addSubview(textLabel)
        
        self.textPrompt = UITextField()
        self.textPrompt.backgroundColor = UIColor.clearColor()
        self.textPrompt.placeholder = "What you wanna say?"
        self.textPrompt.textAlignment = NSTextAlignment.Center
        containerView.addSubview(self.textPrompt)
        
        let nextButtonString = String.fontAwesomeString("fa-arrow-right")
        let nextButtonStringAttributed = NSMutableAttributedString(string: nextButtonString, attributes: [
            NSFontAttributeName: UIFont(name: "HelveticaNeue", size: 11.0)!
            ])
        nextButtonStringAttributed.addAttribute(NSFontAttributeName, value: UIFont(name: "FontAwesome", size: 35.0)!, range: NSRange(location: 0, length: 1))
        nextButtonStringAttributed.addAttribute(NSForegroundColorAttributeName, value: UIColor.blackColor(), range: NSRange(location: 0, length: 1))
        
        let textButton = UIButton()
        textButton.setAttributedTitle(nextButtonStringAttributed, forState: UIControlState.Normal)
        textButton.addTarget(self, action: "startSwipe:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(textButton)
        
        let thanksButton = UIButton()
        thanksButton.setTitle("Dedications", forState: UIControlState.Normal)
        thanksButton.addTarget(self, action: "presentThanksController:", forControlEvents: UIControlEvents.TouchUpInside)
        thanksButton.layer.borderColor = UIColor.whiteColor().CGColor
        thanksButton.layer.borderWidth = 2.0
        thanksButton.layer.cornerRadius = 5.0
        self.view.addSubview(thanksButton)
        
        containerView.anchorInCenterWithWidth(view.width() * 0.7, height: view.height() * 0.3)
        textLabel.anchorTopCenterWithTopPadding(10.0, width: containerView.width() * 0.9, height: containerView.height() * 0.3)
        textPrompt.alignUnder(textLabel, matchingCenterWithTopPadding: 10.0, width: containerView.width() * 0.9, height: containerView.height() * 0.1)
        textButton.alignUnder(textPrompt, matchingCenterWithTopPadding: 10.0, width: 45, height: containerView.height() * 0.3)
        thanksButton.anchorBottomRightWithRightPadding(5.0, bottomPadding: 5.0, width: self.view.width() * 0.4, height: containerView.height() * 0.2)
        
    }
    
    func startSwipe(sender: AnyObject) {
        let swipeNVC = UINavigationController()
        let text = self.textPrompt.text as String?
        self.textPrompt.text = ""
        swipeNVC.viewControllers = [SwipeViewController(tinderText: text)]
        self.presentViewController(swipeNVC, animated: true, completion: nil)
    }
    
    func setBackground() {
        let colorTheme = UIColor.randomFlatColor()
        
        self.navigationController?.navigationBar.barTintColor = colorTheme
        
        let backView = UIView()
        backView.frame = view.bounds
        
//        var gradLayer = createRandomLayer()
        let gradLayer = CALayer()
        gradLayer.backgroundColor = colorTheme.CGColor
        gradLayer.pop_addAnimation(animation(), forKey: nil)
        gradLayer.frame = backView.bounds
        backView.layer.addSublayer(gradLayer)
        
        
        view.addSubview(backView)
    }
    
    func createRandomLayer() -> CAGradientLayer {
        let gradLayer = CAGradientLayer()
        gradLayer.colors = [UIColor.randomFlatColor().CGColor, UIColor.randomFlatColor().CGColor, UIColor.randomFlatColor().CGColor]
        gradLayer.locations = [0.0, 0.5, 1.0]
        
        return gradLayer
    }
    
    func animation() -> POPBasicAnimation {
        let basic = POPBasicAnimation(propertyNamed: kPOPLayerBackgroundColor)
        basic.toValue = UIColor.randomFlatColor()
        basic.autoreverses = true
        basic.repeatForever = true
        basic.duration = 2.4
        
        return basic
    }    
    
}

