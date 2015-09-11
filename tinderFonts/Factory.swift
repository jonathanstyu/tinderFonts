//
//  Factory.swift
//  tinderFonts
//
//  Created by Jonathan Yu on 9/4/15.
//  Copyright (c) 2015 Jonathan Yu. All rights reserved.
//

import Foundation
import UIKit
import ImageIO
import MobileCoreServices

class Factory {
    
    class func importJSON(fileName: String) -> [String: String] {
        let path = NSBundle.mainBundle().pathForResource(fileName, ofType: "json")
        let data = NSFileManager.defaultManager().contentsAtPath(path!)
        
        let jsonResult: [String: String] = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions(0), error: nil) as! [String:String]
        
        return jsonResult
    }
    
    class func createGif(images: [UIImage], loopCount: Int, frameDelay: Double, callback: (data: NSData?, error: NSError?) -> Void) -> Void {
        let fileProperties = [kCGImagePropertyGIFDictionary as String: [kCGImagePropertyGIFLoopCount as String: loopCount]]
        let frameProperties = [kCGImagePropertyGIFDictionary as String: [kCGImagePropertyGIFDelayTime as String: frameDelay]]
        
        let documentsDirectory = NSTemporaryDirectory()
        let url = NSURL(fileURLWithPath: documentsDirectory)?.URLByAppendingPathComponent("animated.gif")
        
        if let url = url {
            let destination = CGImageDestinationCreateWithURL(url, kUTTypeGIF, images.count, nil)
            CGImageDestinationSetProperties(destination, fileProperties)
            
            for i in 0..<images.count {
                CGImageDestinationAddImage(destination, images[i].CGImage, frameProperties)
            }
            
            if CGImageDestinationFinalize(destination) {
                callback(data: NSData(contentsOfURL: url), error: nil)
            } else {
                callback(data: nil, error: NSError())
            }
        } else {
            callback(data: nil, error: NSError())
        }
    }
    
}