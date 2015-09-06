//
//  CardViewControllerCell.swift
//  tinderFonts
//
//  Created by Jonathan Yu on 9/6/15.
//  Copyright (c) 2015 Jonathan Yu. All rights reserved.
//

import Foundation
import UIKit
import ChameleonFramework
import Facade

class CardViewControllerCell: UICollectionViewCell, UIGestureRecognizerDelegate {
    var cardImageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.cardImageView = UIImageView()
        self.contentView.addSubview(self.cardImageView)
        
        self.cardImageView.anchorInCenterWithWidth(50.0, height: 50.0)
        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
}