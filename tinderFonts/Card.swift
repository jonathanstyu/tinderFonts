//
//  Card.swift
//  tinderFonts
//
//  Created by Jonathan Yu on 9/15/15.
//  Copyright (c) 2015 Jonathan Yu. All rights reserved.
//

import Foundation
import UIKit
import ChameleonFramework

class Card: UIView {
    var text: String!
    var textLabel: UILabel!
    var cardColor: UIColor!
    var textPosition: CGRect!
    var legLength: CGFloat!
    var font: String!
    
    class func generateCard(numberCards: Int, options: [String: AnyObject]) -> [Card] {
        let cardArray: [Card] = []
        
        for var i = 0; i < numberCards; ++i {
//            var generatedCard = Card(frame: CGRectZero, font: "Helvetica")
            
//            cardArray.append(generatedCard)
        }
        
        
        return cardArray
    }
    
    init(font: String, text: String) {
        super.init(frame: CGRectZero)
        
        let colorTheme = UIColor(randomFlatColorOfShadeStyle: UIShadeStyle.Light)
        
        self.backgroundColor = colorTheme
        self.font = font
        self.text = text
        
        textLabel = UILabel(frame: CGRectMake(0, 0, self.width(), self.height()))
        textLabel.text = self.text
        textLabel.textColor = ContrastColorOf(colorTheme, true)
        textLabel.font = UIFont(name: self.font, size: 35)
        textLabel.textAlignment = NSTextAlignment.Center
        textLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        textLabel.numberOfLines = 0
        
        self.addSubview(textLabel)
    }
    
    func resetFrame(frameToSet: CGRect) {
        self.frame = frameToSet
        self.textLabel.frame = frameToSet
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}