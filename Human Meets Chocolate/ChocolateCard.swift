//
//  ChocolateCard.swift
//  HumanMeetsChocolate
//
//  Created by Shirley Chu on 7/10/19.
//  Copyright © 2019 Shirley Chu. All rights reserved.
//

import UIKit

class ChocolateCard: UIView {


    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var brand: UILabel!
    @IBOutlet weak var flavor: UILabel!
    @IBOutlet weak var type: UILabel!
    
    var chocolate: Chocolate! {
        didSet{
            brand.text = "Brand: \(chocolate.brand!)"
            flavor.text = "Flavor: \(chocolate.flavor!)"
            type.text = "Type: \(chocolate.type!)"
        }
    }
}
