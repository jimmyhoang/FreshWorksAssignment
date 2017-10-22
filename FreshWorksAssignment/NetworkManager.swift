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
    
    class func getGifs(search:String,completion:@escaping ([Gif]) ->()) {
        let searchTerm = search
        let url = URL(string: "https://api.giphy.com/v1/gifs/search?api_key=7NvUVoGK7iLPdSx2WolS5eyOJD04pdy3&q=\(searchTerm)&limit=25&offset=0&rating=G&lang=en")
        var gifArray:[Gif] = []
        
        Alamofire.request(url!).responseJSON { (response) in
            guard let json = response.result.value as? NSDictionary else {return}
            
            guard let array: NSArray = (json["data"] as? NSArray) else {return}

            for case let dictionary as NSDictionary in array {
                guard let embedURL = dictionary["embed_url"] as? String else {return}
                
                let gif = Gif(URL: embedURL, gifData: UIImage())
                gifArray.append(gif)
            }
           
            self.downloadGifs(gifs: gifArray, completion: { (Gifs) in
                completion(Gifs)
            })
        }
    
    }
    
    class func downloadGifs(gifs:[Gif],completion:([Gif]) ->()) {
        let destination: DownloadRequest.DownloadFileDestination = { _, _ in
            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let fileURL = documentsURL.appendingPathComponent("pig.png")
            
            return (fileURL, [.removePreviousFile, .createIntermediateDirectories])
        }
        
        for gif in gifs {
            Alamofire.download(gif.gifURL, to: destination).response { response in
                if response.error == nil, let imagePath = response.destinationURL?.path {
                    guard let image = UIImage(contentsOfFile: imagePath) else {
                        print("download error")
                        return
                    }
                    gif.gifImage = image
                }
            }
        }
        completion(gifs)
    }
}
