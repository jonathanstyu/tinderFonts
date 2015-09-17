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
        self.fontDescriptions = Factory.importJSON("font-descriptions")
        
        var fontLabel = UILabel(frame: CGRectMake(self.width() * 0.5, 0, self.width(), self.width() * 0.5))
        fontLabel.text = self.fontDescriptions["Abel"]
        fontLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        
        var gestureTap = UITapGestureRecognizer()
        gestureTap.addTarget(self, action: "removeFromSuperView")
        self.addGestureRecognizer(gestureTap)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}