//
//  Gif.swift
//  FreshWorksAssignment
//
//  Created by Jimmy Hoang on 2017-10-10.
//  Copyright © 2017 Jimmy Hoang. All rights reserved.
//

import Foundation
import UIKit

class Gif: NSObject, NSCoding {
    var gifImage: UIImage
    var gifURL: String
    
    init(URL: String, gifData: UIImage) {
        gifURL = URL
        gifImage = gifData
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.gifURL = aDecoder.decodeObject(forKey: "gifURL") as? String ?? ""
        self.gifImage = (aDecoder.decodeObject(forKey: "gifImage") as? UIImage)!
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(gifURL, forKey: "gifURL")
        aCoder.encode(gifImage, forKey: "gifImage")
    }
    
    static func ==(lhs: Gif, rhs: Gif) -> Bool {
        return lhs === rhs
    }
}

