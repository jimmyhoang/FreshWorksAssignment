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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func favouriteButton(_ sender: Any) {
        gif.gifImage = gifImageV.image!
    }
}
