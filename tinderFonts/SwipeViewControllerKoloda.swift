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
import QuartzCore

extension SwipeViewController: KolodaViewDataSource, KolodaViewDelegate {
    // Delegate methods required for Koloda
    
    func generateCards() {
        for var i = 0; i < 10; ++i {
            var fontLibrary = UIFont.familyNames()
            let randomNumber = Int(arc4random_uniform(UInt32(fontLibrary.count)))
            let randomFont: String = fontLibrary[randomNumber] 
            var defaultText = "hello"
            
            if self.tinderText != "" {
                defaultText = self.tinderText
            }
            
            let createdCard = Card(font: randomFont, text: defaultText)
            
            self.cards.append(createdCard)
        }
    }
    
    func kolodaNumberOfCards(koloda: KolodaView) -> UInt {
        return UInt(self.cards.count)
    }
    
    func kolodaViewForCardAtIndex(koloda: KolodaView, index: UInt) -> UIView {
        let card = self.cards[Int(index)]
        
        card.resetFrame(CGRectMake(0, 0, koloda.width(), koloda.height()))
        
        return card
    }
    
    func kolodaViewForCardOverlayAtIndex(koloda: KolodaView, index: UInt) -> OverlayView? {
        return nil
    }
    
    func kolodaDidSwipedCardAtIndex(koloda: KolodaView, index: UInt, direction: SwipeResultDirection) {
        
        if direction == SwipeResultDirection.Right {
            self.imageCache.append(self.currentImage)
            self.imageView.reloadData()
            self.downloadButton.enabled = true
            
            
            setCurrentImage()
        }
    }
    
    func kolodaDidSelectCardAtIndex(koloda: KolodaView, index: UInt) {
        let card = self.cards[Int(index)]
        let fontDescribe = FontViewController(font: card.font)
        self.presentViewController(fontDescribe, animated: true, completion: nil)
    }    
    
    func kolodaDidRunOutOfCards(koloda: KolodaView) {
        print("Out of cards!")
//        swipeView.resetCurrentCardNumber()
        generateCards()
        self.swipeView.reloadData()
    }
    
    func kolodaShouldTransparentizeNextCard(koloda: KolodaView) -> Bool {
        return false
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