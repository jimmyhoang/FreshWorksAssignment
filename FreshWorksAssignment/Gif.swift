//
//  Gif.swift
//  FreshWorksAssignment
//
//  Created by Jimmy Hoang on 2017-10-10.
//  Copyright © 2017 Jimmy Hoang. All rights reserved.
//

import Foundation
import UIKit

class Gif {
    
    var gifImage: UIImage
    var gifURL: String
    
    init(URL: String, gifData: UIImage) {
        gifURL = URL
        gifImage = gifData
    }
}
