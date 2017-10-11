//
//  NetworkManager.swift
//  FreshWorksAssignment
//
//  Created by Jimmy Hoang on 2017-10-10.
//  Copyright © 2017 Jimmy Hoang. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class NetworkManager {
    
    class func getGifs(search:String,completion:([Gif]) ->()) {
        let searchTerm = search
        let url = URL(string: "https://api.giphy.com/v1/gifs/search?api_key=7NvUVoGK7iLPdSx2WolS5eyOJD04pdy3&q=\(searchTerm)&limit=25&offset=0&rating=G&lang=en")
        var gifArray:[Gif] = []
        
        Alamofire.request(url!).responseJSON { (response) in
            guard let json = response.result.value as? NSDictionary else {return}
            
            guard let array: NSArray = (json["data"] as? NSArray) else {return}

            for case let dictionary as NSDictionary in array {
                guard let embedURL = dictionary["embed_url"] as? String else {return}
                
                let gif = Gif(URL: embedURL)
                gifArray.append(gif)
            }
           
            for gif in gifArray {
                print(gif.gifURL)
            }
            
        }
    
    }
}
