//
//  DetailViewController.swift
//  
//
//  Created by Shirley Chu on 7/15/19.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    
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
        imageView.image = imagetoLoad
        imageView.layer.cornerRadius = 8
        brand.text = "Brand: \(chocolate.brand!)"
        flavor.text = "Flavor: \(chocolate.flavor!)"
        type.text = "Type: \(chocolate.type!)"
        about.text = "I am...\n\(chocolate.about ?? ""))"
        about.sizeToFit()
        interests.text = "I like...\n\("Long walks on the beach")"
        interests.sizeToFit()
        idealMatch.text = "My ideal match is... \n\(chocolate.targetUser ?? "A lovely soul")"
        idealMatch.sizeToFit()
        
        contentView.layer.cornerRadius = 8
        
        let nav = self.navigationController!.navigationBar
        
        let yellow = UIColor(rgb: 0xFFF8DC)

        nav.barStyle = .black
        self.title = "Profile"
        }
    

}


extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
