//
//  ResultsViewController.swift
//  HumanMeetsChocolate
//
//  Created by Shirley Chu on 7/22/19.
//  Copyright © 2019 Shirley Chu. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    var recommendations: [Chocolate]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("recommendations for results controller")
        print(recommendations)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "KolodaSegue" {

        }
    }
}
