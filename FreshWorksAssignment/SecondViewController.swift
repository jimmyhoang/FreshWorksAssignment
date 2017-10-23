//
//  SecondViewController.swift
//  FreshWorksAssignment
//
//  Created by Jimmy Hoang on 2017-10-10.
//  Copyright © 2017 Jimmy Hoang. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = UIImage.gifImageWithURL(gifUrl: "https://media1.giphy.com/media/mokQK7oyiR8Sk/giphy.gif")
        imageView.image = url
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

