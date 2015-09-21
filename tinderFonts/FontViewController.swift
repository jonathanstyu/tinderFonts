//
//  FontViewController.swift
//  tinderFonts
//
//  Created by Jonathan Yu on 9/20/15.
//  Copyright © 2015 Jonathan Yu. All rights reserved.
//

import Foundation
import UIKit
import pop
import Facade

class FontViewController: UIViewController, UIGestureRecognizerDelegate {
    var fontName: String!
    var fontDescriptions: [String:String]!
    var createdCard: Card!
    var descriptionLabel: UILabel!
    
    init(font: String) {
        super.init(nibName: nil, bundle: nil)
        
        self.fontName = font
        self.fontDescriptions = Factory.importJSON("font-descriptions")
        createUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.flatWhiteColor()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    func createUI() {
        createdCard = Card(font: fontName, text: fontName)
        
        let viewFrame = CGRectMake(0, view.frame.maxY / 2.0, view.width(), (view.frame.size.height / 2.0))
        let cardFrame = CGRectMake(0, 0, view.width(), view.frame.size.height / 2.0)
        descriptionLabel = UILabel(frame: viewFrame)
        let dismissGesture = UITapGestureRecognizer(target: self, action: "dismissView:")
        dismissGesture.delegate = self
        view.addGestureRecognizer(dismissGesture)

        descriptionLabel.font = UIFont(name: fontName, size: 18.0)
        descriptionLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        descriptionLabel.numberOfLines = 0
        descriptionLabel.text = fontDescriptions[fontName]
        descriptionLabel.backgroundColor = UIColor.flatWhiteColor()
        
        createdCard.resetFrame(cardFrame)

        self.view.addSubview(descriptionLabel)
        self.view.addSubview(createdCard)
    }
    
    func dismissView(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    
}