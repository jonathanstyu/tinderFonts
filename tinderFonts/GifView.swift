//
//  ImageViewController.swift
//  tinderFonts
//
//  Created by Jonathan Yu on 9/9/15.
//  Copyright (c) 2015 Jonathan Yu. All rights reserved.
//

import Foundation
import UIKit
import Facade

class GifView: UIView {
    var gifData: UIImage!
    var visualbg: UIVisualEffectView!
    
    init(gifImage: NSData?, frame: CGRect) {
        super.init(frame: frame)
        self.gifData = UIImage.animatedImageWithData(gifImage!)
        
        createUI()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func createUI() {
        
        var imageView = UIImageView()
        imageView.image = gifData
        imageView.contentMode = UIViewContentMode.ScaleAspectFit
        imageView.frame = CGRectMake(0, 0, 300, 300)
        imageView.center = self.center
        
        var blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        visualbg = UIVisualEffectView(effect: blurEffect)
        visualbg.frame = self.frame
        self.addSubview(visualbg)
        self.addSubview(imageView)
    }
    
}