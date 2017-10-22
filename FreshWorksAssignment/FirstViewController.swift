//
//  FirstViewController.swift
//  FreshWorksAssignment
//
//  Created by Jimmy Hoang on 2017-10-10.
//  Copyright © 2017 Jimmy Hoang. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var gifArray:[Gif] = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NetworkManager.getGifs(search: "dogs") { (gifs) in
            self.gifArray = gifs
            self.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //MARK: UITableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gifArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gifCell", for: indexPath) as! GifTableViewCell
        let gif  = gifArray[indexPath.row]
        cell.gif = gif
        
        return cell
    }

}

