//
//  ViewController.swift
//  tinderFonts
//
//  Created by Jonathan Yu on 8/31/15.
//  Copyright (c) 2015 Jonathan Yu. All rights reserved.
//

import UIKit
import ChameleonFramework

class StartViewController: UIViewController {
    var tinderTextField: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Start!", style: UIBarButtonItemStyle.Plain, target: self, action: "startButtonTouched:")
        
        self.title = "Hello"
        self.tinderTextField = UITextView(frame: self.view.frame)
        self.tinderTextField.backgroundColor = UIColor(gradientStyle: UIGradientStyle.TopToBottom, withFrame: self.view.frame, andColors: [RandomFlatColorWithShade(.Light), RandomFlatColorWithShade(.Dark)])

        tinderTextField.text = "Hello"
        
        self.view.addSubview(self.tinderTextField)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func startButtonTouched(sender: AnyObject) {
        var swipeNVC = UINavigationController()
        swipeNVC.viewControllers = [SwipeViewController(tinderText: self.tinderTextField.text)]
        self.presentViewController(swipeNVC, animated: true, completion: nil)
    }

}

