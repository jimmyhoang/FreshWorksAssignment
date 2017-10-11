//
//  NetworkManager.swift
//  FreshWorksAssignment
//
//  Created by Jimmy Hoang on 2017-10-10.
//  Copyright © 2017 Jimmy Hoang. All rights reserved.
//

import Foundation
import UIKit

class NetworkManager {
    
    class func getGifs(search:String,completion:([UIImage]) ->()) {
        let searchTerm = search
        let url = URL(string: "https://api.giphy.com/v1/gifs/search?api_key=7NvUVoGK7iLPdSx2WolS5eyOJD04pdy3&q=\(searchTerm)&limit=25&offset=0&rating=G&lang=en")
    }
}
