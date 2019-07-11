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
            brand.text = chocolate.brand
            flavor.text = chocolate.flavor
            type.text = chocolate.type
        }
    }
}
