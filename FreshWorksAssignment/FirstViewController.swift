//
//  FirstViewController.swift
//  FreshWorksAssignment
//
//  Created by Jimmy Hoang on 2017-10-10.
//  Copyright © 2017 Jimmy Hoang. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var gifArray:[Gif] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupGifs(search:String) {
        gifArray.removeAll()
        NetworkManager.getGifs(search: search) { (gifs) in
            self.gifArray = gifs
            self.tableView.reloadData()
        }
    }
    
    //MARK: UITableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gifArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gifCell", for: indexPath) as! GifTableViewCell
        let gif  = gifArray[indexPath.row]

        let imageURL = UIImage.gifImageWithURL(gifUrl: gif.gifURL)
        
        cell.gif = gif
        
        cell.gifImageV.image = imageURL
        
        return cell
    }
    
    //MARK: UITextFieldDelete
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        setupGifs(search: searchField.text!)
        return false
    }

}

