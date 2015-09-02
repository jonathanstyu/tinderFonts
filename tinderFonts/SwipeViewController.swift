//
//  SwipeViewController.swift
//  tinderFonts
//
//  Created by Jonathan Yu on 9/1/15.
//  Copyright (c) 2015 Jonathan Yu. All rights reserved.
//

import Foundation
import UIKit
import Koloda
import pop

class SwipeViewController: UIViewController, KolodaViewDataSource, KolodaViewDelegate {
    var cardCount: Int = 1
    var tinderText: String!
    
    convenience init() {
        self.init(tinderText: nil)
    }
    
    init(tinderText: String?) {
        self.tinderText = tinderText
        super.init(nibName: nil, bundle: nil)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Cancel, target: self, action: "dismiss")
    }
    
//    Other Methods
    func dismiss() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
// Delegate methods required
    
    func kolodaNumberOfCards(koloda: KolodaView) -> UInt {
        return 5
    }
    
    func kolodaViewForCardAtIndex(koloda: KolodaView, index: UInt) -> UIView {
        var card = UIView()
        
        return card
    }
    
    func kolodaViewForCardOverlayAtIndex(koloda: KolodaView, index: UInt) -> OverlayView? {
        return nil
    }
    
    func kolodaDidSwipedCardAtIndex(koloda: KolodaView, index: UInt, direction: SwipeResultDirection) {
        cardCount += 1
    }
    
    func kolodaDidSelectCardAtIndex(koloda: KolodaView, index: UInt) {
        println(cardCount)
    }
    
    func kolodaDidRunOutOfCards(koloda: KolodaView) {
        println("Out of cards!")
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