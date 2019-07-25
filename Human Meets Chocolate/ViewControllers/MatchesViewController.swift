//
//  MatchesViewController.swift
//  HumanMeetsChocolate
//
//  Created by Shirley Chu on 7/17/19.
//  Copyright © 2019 Shirley Chu. All rights reserved.
//

import UIKit

class MatchesViewController: UITableViewController {
    
    
    static var matches: [Chocolate] = []
    var matches: [Chocolate] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        matches = MatchesViewController.matches
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        matches = MatchesViewController.matches
        tableView.reloadData()
    }
    
    //    loads as many cells as there are matches 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matches.count
    }
    
    //    assigns pictures and text to cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Match", for: indexPath) as! MatchCell
        cell.chocolate = matches[indexPath.row]
        return cell
    }
    
//    loads detail page on selecting cell
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let detailView = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            let chocolate = matches[indexPath.row]
            detailView.chocolate = chocolate
            navigationController?.pushViewController(detailView, animated: true)
        }
    }

    
}
