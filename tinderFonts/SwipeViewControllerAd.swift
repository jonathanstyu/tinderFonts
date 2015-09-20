//
//  SwipeViewControllerAd.swift
//  tinderFonts
//
//  Created by Jonathan Yu on 9/20/15.
//  Copyright © 2015 Jonathan Yu. All rights reserved.
//

import Foundation
import iAd
import UIKit

extension SwipeViewController: ADBannerViewDelegate {
    
    func createAdBanner() {
        let adView = ADBannerView(adType: ADAdType.Banner)
        adView.delegate = self
    }
    
    func bannerViewDidLoadAd(banner: ADBannerView!) {
        self.view.addSubview(adView)
        
        self.adView.frame.origin.y = self.view.frame.size.height
    }
    
    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
        adView.removeFromSuperview()
    }
    
}