//
//  CardTapView.swift
//  tinderFonts
//
//  Created by Jonathan Yu on 9/15/15.
//  Copyright (c) 2015 Jonathan Yu. All rights reserved.
//

import Foundation
import UIKit
import ChameleonFramework

class CardTapView: UIView, UIGestureRecognizerDelegate {
    var card: Card!
    var fontDescriptions: [String: String]!
    
    init(card: Card, frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.flatWhiteColor()
        
        self.fontDescriptions = Factory.importJSON("font-descriptions")
        card.frame = CGRectMake(0, 0, self.width(), self.height() * 0.5)
        self.addSubview(card)
        
        let fontLabel = UILabel(frame: CGRectMake(0, self.height() * 0.5, self.width(), self.width() * 0.5))
        fontLabel.text = self.fontDescriptions["Abel"]
        fontLabel.font = UIFont(name: "Abel", size: 25.0)
        fontLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        self.addSubview(fontLabel)
        
        let gestureTap = UITapGestureRecognizer()
        gestureTap.addTarget(self, action: "removeFromView:")
        self.addGestureRecognizer(gestureTap)
    }
    
    func removeFromView(sender: AnyObject) {
        self.removeFromSuperview()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}