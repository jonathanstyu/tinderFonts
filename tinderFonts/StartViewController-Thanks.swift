//
//  StartViewController-Thanks.swift
//  tinderFonts
//
//  Created by Jonathan Yu on 10/22/15.
//  Copyright © 2015 Jonathan Yu. All rights reserved.
//

import Foundation
import UIKit

extension StartViewController: UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    
    
    func presentThanksController(sender: AnyObject) {
        var fontLibrary = UIFont.familyNames()
        let randomNumber = Int(arc4random_uniform(UInt32(fontLibrary.count)))
        let randomFont: String = fontLibrary[randomNumber]
        
        let thanksVC = FontViewController(font: randomFont)
        thanksVC.createdCard.textLabel.text = "Thanks and Dedication \n (In \(randomFont))"
        thanksVC.descriptionLabel.text = "This would not exist without the following products: \n \n Facade \n FontBlaster \n Koloda \n Chameleon \n \nDescriptions via Wikipedia \nThanks to Do-Hee Kim for inspiring this project with 100daysoffonts.com"
        thanksVC.transitioningDelegate = self
        thanksVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        self.presentViewController(thanksVC, animated: true, completion: nil)
    }

    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = true
        return self
    }

    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = false
        return self
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return animationDuration
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView()
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        toViewController!.view.frame = fromViewController!.view.frame
        
        if (self.isPresenting == true) {
            toViewController!.view.alpha = 0
            toViewController!.view.transform = CGAffineTransformMakeScale(0, 0)
            
            UIView.animateWithDuration(animationDuration, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.3, options: [], animations: { () -> Void in
                toViewController!.view.alpha = 1
                toViewController!.view.transform = CGAffineTransformMakeScale(1, 1)
                containerView?.addSubview(toViewController!.view)
                }, completion: { (completed) -> Void in
                    transitionContext.completeTransition(completed)
            })
        } else {
            UIView.animateWithDuration(animationDuration, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.3, options: [], animations: { () -> Void in
                fromViewController!.view.alpha = 0
                fromViewController!.view.transform = CGAffineTransformMakeScale(0.001, 0.001)
                }, completion: { (completed) -> Void in
                    fromViewController?.view.removeFromSuperview()
                    transitionContext.completeTransition(completed)
            })
        }
    }

}