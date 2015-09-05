//
//  Factory.swift
//  tinderFonts
//
//  Created by Jonathan Yu on 9/4/15.
//  Copyright (c) 2015 Jonathan Yu. All rights reserved.
//

import Foundation
import UIKit

class Factory {
    
    class func importJSON(fileName: String) -> [String: String] {
        let path = NSBundle.mainBundle().pathForResource(fileName, ofType: "json")
        let data = NSFileManager.defaultManager().contentsAtPath(path!)
        
        let jsonResult: [String: String] = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions(0), error: nil) as! [String:String]
        
        return jsonResult
    }
    
}