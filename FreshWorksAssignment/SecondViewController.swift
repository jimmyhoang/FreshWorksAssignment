//
//  SecondViewController.swift
//  FreshWorksAssignment
//
//  Created by Jimmy Hoang on 2017-10-10.
//  Copyright © 2017 Jimmy Hoang. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    var favouriteGifs:[Gif] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let unarchiveGifs = UserDefaults.standard.object(forKey: "favouriteGifs") as? Data {
            favouriteGifs = NSKeyedUnarchiver.unarchiveObject(with: unarchiveGifs) as! [Gif]
            collectionView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let unarchiveGifs = UserDefaults.standard.object(forKey: "favouriteGifs") as? Data {
            favouriteGifs = NSKeyedUnarchiver.unarchiveObject(with: unarchiveGifs) as! [Gif]
            collectionView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: UICollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favouriteGifs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "faveGifCell", for: indexPath) as! FaveGifCollectionViewCell
        let gif  = favouriteGifs[indexPath.row]
        
        let imageURL = UIImage.gifImageWithURL(gifUrl: gif.gifURL)

        cell.gifImage.image = imageURL

        return cell
    }

}

