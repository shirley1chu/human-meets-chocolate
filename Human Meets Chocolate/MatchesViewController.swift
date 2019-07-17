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
    
    //    loads as many cells as there are pictures
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matches.count
    }
    
    //    assigns cell's text to pictures's file name, and returns the cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Match", for: indexPath) as! MatchCell
        cell.chocolate = matches[indexPath.row]
        return cell
    }
    
    
}
