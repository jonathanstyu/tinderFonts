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
        
//        This section is for the actual card
        var textCard = UIView()
        var textCardBorder: CGFloat = 10.0
        var colorTheme = UIColor(randomFlatColorOfShadeStyle: UIShadeStyle.Light)
        
        textCard.tag = 0
        textCard.frame = CGRectMake(textCardBorder, (fontLabel.frame.height + textCardBorder), card.frame.width - (2 * textCardBorder), card.frame.width - (2 * textCardBorder))
        textCard.backgroundColor = colorTheme
        
        var textLabel = UILabel(frame: CGRectMake(0, 0, textCard.width(), textCard.height()))
        textLabel.text = self.tinderText
        textLabel.textColor = ContrastColorOf(colorTheme, true)
        textLabel.font = UIFont(name: randomFont, size: 35)
        textLabel.textAlignment = NSTextAlignment.Center
        textLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        textLabel.numberOfLines = 0
        textCard.addSubview(textLabel)
        
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
        
        if direction == SwipeResultDirection.Right {
            self.imageCache.append(self.currentImage)
            self.imageView.reloadData()
            
            var textCard: UIView = koloda.subviews[2] as! UIView
            println(textCard)
            UIGraphicsBeginImageContextWithOptions(textCard.frame.size, false, self.view.window!.screen.scale as CGFloat)
            textCard.drawViewHierarchyInRect(textCard.frame, afterScreenUpdates: false)
            self.currentImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
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