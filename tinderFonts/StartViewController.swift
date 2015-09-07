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

class StartViewController: UIViewController {
    var tinderTextField: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Hello There"
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
        var inputTextField = UITextField()
        
//        Initialize the UIAlertController
        let addItem: UIAlertController = UIAlertController(title: "What text do you wanna try out?", message: "Write it down here!", preferredStyle: .Alert)
        
//        Initalize the Text Field
        addItem.addTextFieldWithConfigurationHandler { (textField) -> Void in
            inputTextField = textField
        }
        
//        Initialize the button
        let cancelItem: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil )
//        addItem.addAction(cancelItem)
        
//        Initialize the Confirm button
        let addItemButton: UIAlertAction = UIAlertAction(title: "Get Started", style: .Default, handler: { action -> Void in
            var swipeNVC = UINavigationController()
            let text = inputTextField.text as String
            println(text)
            
            swipeNVC.viewControllers = [SwipeViewController(tinderText: text)]
            self.presentViewController(swipeNVC, animated: true, completion: nil)
        })
        
        addItem.addAction(addItemButton)
        
        self.navigationController!.presentViewController(addItem, animated: true, completion: nil)
    }
    
    func setBackground() {
        var colorTheme = UIColor.randomFlatColor()
        
        self.navigationController?.navigationBar.barTintColor = colorTheme
        
        var backView = UIView()
        backView.frame = view.bounds
        
//        var gradLayer = createRandomLayer()
        var gradLayer = CALayer()
        gradLayer.backgroundColor = colorTheme.CGColor
        gradLayer.pop_addAnimation(animation(), forKey: nil)
        gradLayer.frame = backView.bounds
        backView.layer.addSublayer(gradLayer)
        
        
        view.addSubview(backView)
    }
    
    func createRandomLayer() -> CAGradientLayer {
        var gradLayer = CAGradientLayer()
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

