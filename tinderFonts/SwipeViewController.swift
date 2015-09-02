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
import ChameleonFramework

class SwipeViewController: UIViewController, KolodaViewDataSource, KolodaViewDelegate {
    var cardCount: Int = 5
    var tinderText: String!
    var swipeView: KolodaView!
    
    convenience init() {
        self.init(tinderText: nil)
    }
    
    init(tinderText: String?) {
        super.init(nibName: nil, bundle: nil)
        self.tinderText = tinderText
        self.swipeView = KolodaView()
        self.swipeView.delegate = self
        self.swipeView.dataSource = self
        
        self.view.backgroundColor = UIColor(gradientStyle: UIGradientStyle.TopToBottom, withFrame: self.view.frame, andColors: [RandomFlatColorWithShade(.Light), RandomFlatColorWithShade(.Dark)])
        
        self.swipeView.frame = CGRectMake(40, 40, 200, 500)
        self.view.addSubview(self.swipeView)
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
        var card = UIView(frame: CGRectMake(0, 0, 100, 120))
        card.backgroundColor = UIColor.randomFlatColor()
        
        var label = UILabel(frame: card.frame)
        label.text = "Card \(index)"
        card.addSubview(label)
        
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