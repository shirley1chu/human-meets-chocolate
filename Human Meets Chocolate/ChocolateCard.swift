//
//  ChocolateCard.swift
//  HumanMeetsChocolate
//
//  Created by Shirley Chu on 7/10/19.
//  Copyright © 2019 Shirley Chu. All rights reserved.
//

import UIKit
import FirebaseStorage
import FirebaseUI

class ChocolateCard: UIView {


    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var brand: UILabel!
    @IBOutlet weak var flavor: UILabel!
    @IBOutlet weak var type: UILabel!
    
    var chocolate: Chocolate! {
        didSet{
            let storageRef = Storage.storage().reference()
            let imageRef = storageRef.child("\(chocolate.id!).jpg")
            imageView.sd_setImage(with: imageRef)
//            print("imageRef")
//            print(imageRef)
//            let url = NSURL(string: imageRef!) as! URL
//            if let imageData: NSData = NSData(contentsOf: url) {
//                imageView.image = UIImage(data: imageData as Data)
//            }
//            imageView.image = UIImage(named: "\(chocolate.id!)")
            brand.text = "Brand: \(chocolate.brand!)"
            flavor.text = "Flavor: \(chocolate.flavor!)"
            type.text = "Type: \(chocolate.type!.capitalized)"
            imageView.layer.cornerRadius = 8
        }
    }
}
