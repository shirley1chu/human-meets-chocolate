//
//  DetailViewController.swift
//  
//
//  Created by Shirley Chu on 7/15/19.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var brand: UILabel!
    @IBOutlet weak var flavor: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var about: UILabel!
    @IBOutlet weak var interests: UILabel!
    @IBOutlet weak var idealMatch: UILabel!
    
    var chocolate: Chocolate!
    var imagetoLoad: UIImage?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        imageView.image = imagetoLoad
        brand.text = "Brand: \(chocolate.brand!)"
        flavor.text = "Flavor: \(chocolate.flavor!)"
        type.text = "Type: \(chocolate.type!)"
        about.text = "I am...\n \(chocolate.about ?? ""))"
        about.sizeToFit()
        interests.text = "I like...\n \("Long walks on the beach")"
        idealMatch.text = "My ideal match is... \n \(chocolate.targetUser ?? "A lovely soul")"
        }
    }


