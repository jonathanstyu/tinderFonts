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
import Facade

class SwipeViewController: UIViewController, KolodaViewDataSource, KolodaViewDelegate {
    var cardCount: Int = 5
    var tinderText: String!
    var swipeView: KolodaView!
    
    var rightSwipeButton: UIButton!
    var leftSwipeButton: UIButton!
    
    convenience init() {
        self.init(tinderText: nil)
    }
    
    init(tinderText: String?) {
        super.init(nibName: nil, bundle: nil)
        self.tinderText = tinderText
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = tinderText
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Cancel, target: self, action: "dismiss")
        self.view.backgroundColor = UIColor(gradientStyle: UIGradientStyle.TopToBottom, withFrame: self.view.frame, andColors: [UIColor.flatGrayColor(), RandomFlatColorWithShade(.Dark)])
        
        customizeUIElements()
        layoutFacade()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.swipeView.reloadData()
    }
    
//    Other Methods
    func dismiss() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func customizeUIElements() {
        self.swipeView = KolodaView()
        self.swipeView.delegate = self
        self.swipeView.dataSource = self
        self.view.addSubview(self.swipeView)
        
        self.rightSwipeButton = UIButton()
        self.rightSwipeButton.setTitle("RIGHT", forState: UIControlState.Normal)
        self.rightSwipeButton.addTarget(self, action: "rightButtonTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(self.rightSwipeButton)
        
        self.leftSwipeButton = UIButton()
        self.leftSwipeButton.setTitle("LEFT", forState: UIControlState.Normal)
        self.leftSwipeButton.addTarget(self, action: "leftButtonTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(self.leftSwipeButton)
    }
    
    func layoutFacade() {
        var topBorder: CGFloat = self.navigationController!.navigationBar.frame.height
        var visibleHeight:CGFloat = self.view.frame.height - topBorder
        
        self.swipeView.anchorTopCenterFillingWidthWithLeftAndRightPadding(25.0,topPadding: 50.0 + topBorder, height: visibleHeight * 0.6)
        self.view.groupHorizontally([self.leftSwipeButton, self.rightSwipeButton], centeredUnderView: self.swipeView, topPadding: 50.0, spacing: 75.0, width: 50, height: 35)
        
        
    }
    
    func leftButtonTapped(target: AnyObject) {
        self.swipeView.swipe(SwipeResultDirection.Left)
    }
    
    func rightButtonTapped(target: AnyObject) {
        self.swipeView.swipe(SwipeResultDirection.Right)
    }
    
// Delegate methods required for Koloda
    
    func kolodaNumberOfCards(koloda: KolodaView) -> UInt {
        return 5
    }
    
    func kolodaViewForCardAtIndex(koloda: KolodaView, index: UInt) -> UIView {
        var card = UIView(frame: CGRectMake(0, 0, koloda.width(), koloda.height()))
        println(card.width())
        card.backgroundColor = UIColor.randomFlatColor()
        card.layer.cornerRadius = 12.0
        card.clipsToBounds = true
        
        var label = UILabel(frame: CGRectMake(0, 0, card.frame.width, 45))
        label.backgroundColor = UIColor.whiteColor()
        label.text = "Card \(index)"
        label.textAlignment = NSTextAlignment.Center
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