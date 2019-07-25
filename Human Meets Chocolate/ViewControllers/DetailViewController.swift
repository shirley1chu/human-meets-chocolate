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
    
    @IBOutlet weak var purchaseButton: UIButton!
    
    var chocolate: Chocolate!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = UIImage(named: "\(chocolate.id!)")
        imageView.layer.cornerRadius = 8
        brand.attributedText = varyBoldText(boldText: "Brand: ", regularText: "\(chocolate.brand!)")
        flavor.attributedText = varyBoldText(boldText: "Flavor: ", regularText: "\(chocolate.flavor!)")
        type.attributedText = varyBoldText(boldText: "Type: ", regularText: "\(chocolate.type!.capitalized)")
        about.attributedText = varyBoldText(boldText: "I am...\n", regularText: "\(chocolate.about ?? "")")
        about.sizeToFit()
        interests.attributedText = varyBoldText(boldText: "I like...\n", regularText: "\( chocolate.notes?.capitalizingFirstLetter() ?? "Long walks on the beach")")
        interests.sizeToFit()
        idealMatch.attributedText = varyBoldText(boldText: "My ideal match is...\n", regularText: "\(chocolate.targetUser ?? "A lovely soul")")
        idealMatch.sizeToFit()
        
        contentView.layer.cornerRadius = 8
        purchaseButton.layer.cornerRadius = 8
        purchaseButton.sizeToFit()
        self.title = "Profile"
        
        print(chocolate.purchaseLink)
        }
    
    func varyBoldText (boldText: String, regularText: String) ->  NSAttributedString {
        let boldAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17)]
        let regularAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17)]
        
        let boldTextNS = NSMutableAttributedString(string: boldText, attributes: boldAttributes)
        let regularTextNS = NSMutableAttributedString(string: regularText, attributes: regularAttributes)
        
        boldTextNS.append(regularTextNS)
        return boldTextNS
    }
    
    @IBAction func puchaseButtonTapped(_ sender: Any) {
        let purchaseLink = chocolate.purchaseLink 
        if let url = URL(string: purchaseLink!) {
            UIApplication.shared.open(url)
        }
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
