//
//  GifTableViewCell.swift
//  FreshWorksAssignment
//
//  Created by Jimmy Hoang on 2017-10-22.
//  Copyright © 2017 Jimmy Hoang. All rights reserved.
//

import UIKit

class GifTableViewCell: UITableViewCell {
    
    @IBOutlet weak var gifImageV: UIImageView!
    var gif: Gif!
    var favouriteGifs = [Gif]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    @IBAction func favouriteButton(_ sender: Any) {        
        if let unarchiveGifs = UserDefaults.standard.object(forKey: "favouriteGifs") as? Data {
            favouriteGifs = NSKeyedUnarchiver.unarchiveObject(with: unarchiveGifs) as! [Gif]
        }

        gif.gifImage = gifImageV.image!
        
        let isFave = favouriteGifs.contains(gif)
        
        if (isFave) {
            let index = favouriteGifs.index(of: gif)
            favouriteGifs.remove(at: index!)
        } else {
            favouriteGifs.append(gif)
        }
        
        let archiveGifs = NSKeyedArchiver.archivedData(withRootObject: favouriteGifs)
        UserDefaults.standard.set(archiveGifs, forKey: "favouriteGifs")
        UserDefaults.standard.synchronize()
    }
}
