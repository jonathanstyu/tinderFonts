//
//  SwipeViewControllerGallery.swift
//  tinderFonts
//
//  Created by Jonathan Yu on 9/5/15.
//  Copyright (c) 2015 Jonathan Yu. All rights reserved.
//

import Foundation
import UIKit
import ChameleonFramework

extension SwipeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionViewScrollDirection.Horizontal
        
        self.imageView = UICollectionView(frame: CGRectMake(0, 0, 0, 0), collectionViewLayout: layout)
        self.imageView.delegate = self
        self.imageView.dataSource = self
        self.imageView.bounces = true
        self.imageView.backgroundColor = ComplementaryFlatColorOf(UIColor.flatSandColor())
        self.imageView.registerClass(CardViewControllerCell.self, forCellWithReuseIdentifier: "cell")
        
        self.view.addSubview(self.imageView)        
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = imageView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CardViewControllerCell
        cell.backgroundColor = UIColor.flatWhiteColorDark()
        cell.cardImageView.image = self.imageCache[indexPath.row]
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.imageCache.count > 0 {
            return self.imageCache.count
        }
        
        return self.imageCache.count
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let topBorder: CGFloat = self.navigationController!.navigationBar.frame.height
        let visibleHeight:CGFloat = self.view.frame.height - topBorder
        return CGSizeMake(visibleHeight * 0.12, visibleHeight * 0.12)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 15.0
    }
    
}