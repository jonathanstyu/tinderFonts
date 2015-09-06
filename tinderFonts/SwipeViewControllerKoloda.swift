//
//  SwipeViewControllerKoloda.swift
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

extension SwipeViewController: KolodaViewDataSource, KolodaViewDelegate {
    // Delegate methods required for Koloda
    
    func kolodaNumberOfCards(koloda: KolodaView) -> UInt {
        return UInt(cardCount)
    }
    
    func kolodaViewForCardAtIndex(koloda: KolodaView, index: UInt) -> UIView {
        var card = UIView(frame: CGRectMake(0, 0, koloda.width(), koloda.height()))
        var fontLabel = UILabel(frame: CGRectMake(0, 0, card.frame.width, 35))
        var fontLibrary = UIFont.familyNames()
        var randomNumber = Int(arc4random_uniform(UInt32(fontLibrary.count)))
        
        card.backgroundColor = UIColor.flatWhiteColorDark()
        card.layer.cornerRadius = 12.0
        card.clipsToBounds = true
        
        var randomFont: String = fontLibrary[randomNumber] as! String
        fontLabel.backgroundColor = UIColor.flatWhiteColor()
        fontLabel.text = "Font: \(randomFont)"
        fontLabel.font = UIFont(name: randomFont, size: 15)
        fontLabel.textAlignment = NSTextAlignment.Center
        card.addSubview(fontLabel)
        
        var textCard = UIView()
        var textCardBorder: CGFloat = 10.0
        textCard.frame = CGRectMake(textCardBorder, (fontLabel.frame.height + textCardBorder), card.frame.width - (2 * textCardBorder), card.frame.width - (2 * textCardBorder))
        textCard.backgroundColor = UIColor.randomFlatColor()
        card.addSubview(textCard)
        
        return card
    }
    
    func kolodaViewForCardOverlayAtIndex(koloda: KolodaView, index: UInt) -> OverlayView? {
        return nil
    }
    
    func kolodaDidSwipedCardAtIndex(koloda: KolodaView, index: UInt, direction: SwipeResultDirection) {
        if (cardCount - Int(index)) == 7 {
            cardCount += 11
            swipeView.reloadData()
        }
    }
    
    func kolodaDidSelectCardAtIndex(koloda: KolodaView, index: UInt) {
        println(cardCount)
    }
    
    func kolodaDidRunOutOfCards(koloda: KolodaView) {
        println("Out of cards!")
        swipeView.resetCurrentCardNumber()
    }
    
    func kolodaShouldTransparentizeNextCard(koloda: KolodaView) -> Bool {
        return true
    }
    
    func kolodaShouldMoveBackgroundCard(koloda: KolodaView) -> Bool {
        return true
    }
    
    func kolodaShouldApplyAppearAnimation(koloda: KolodaView) -> Bool {
        return true
    }
    
    func kolodaBackgroundCardAnimation(koloda: KolodaView) -> POPPropertyAnimation? {
        return nil
    }
}