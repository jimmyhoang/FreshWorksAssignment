//
//  FaveGifCollectionViewCell.swift
//  FreshWorksAssignment
//
//  Created by Jimmy Hoang on 2017-10-23.
//  Copyright © 2017 Jimmy Hoang. All rights reserved.
//

import UIKit

protocol FaveGifCellDelegate:class {
    func removedFaveGif()
}

class FaveGifCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var gifImage: UIImageView!
    weak var controllerDelegate:FaveGifCellDelegate?
    var gif: Gif!
    var favouriteGifs = [Gif]()
    
    
    @IBAction func faveButton(_ sender: Any) {
        if let unarchiveGifs = UserDefaults.standard.object(forKey: "favouriteGifs") as? Data {
            favouriteGifs = NSKeyedUnarchiver.unarchiveObject(with: unarchiveGifs) as! [Gif]
        }
        
        var index = 0
        
        for fGif in favouriteGifs {
            if fGif.gifURL == gif.gifURL {
                index = favouriteGifs.index(of: fGif)!
                favouriteGifs.remove(at: index)
            }
        }

        let archiveGifs = NSKeyedArchiver.archivedData(withRootObject: favouriteGifs)
        UserDefaults.standard.set(archiveGifs, forKey: "favouriteGifs")
        UserDefaults.standard.synchronize()
        controllerDelegate?.removedFaveGif()
    }
}
