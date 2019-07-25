//
//  ResultsViewController.swift
//  HumanMeetsChocolate
//
//  Created by Shirley Chu on 7/22/19.
//  Copyright © 2019 Shirley Chu. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var resultsButton: UIButton!
    var recommendations: [Chocolate]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultsButton.layer.cornerRadius = 8 
        print("recommendations for results controller")
        print(recommendations)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TabSegue" {
            let tabBarController = segue.destination as? UITabBarController
            let navigationController = tabBarController?.viewControllers?.first as? UINavigationController
            let kolodaViewController = navigationController?.viewControllers.first as? KolodaViewController
            kolodaViewController?.recommendations = recommendations
        }
    }
}
