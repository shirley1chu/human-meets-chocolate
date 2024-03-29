//
//  MatchCell.swift
//  
//
//  Created by Shirley Chu on 7/17/19.
//

import UIKit

class MatchCell: UITableViewCell {

    @IBOutlet weak var cellImage: UIImageView!
    
    @IBOutlet weak var brandLabel: UILabel!
    

    @IBOutlet weak var flavorLabel: UILabel!
    
    var chocolate: Chocolate! {
        didSet {
            guard let chocolate = chocolate else { return }
            brandLabel.text = chocolate.brand
            flavorLabel.text = chocolate.flavor
            cellImage.image = UIImage(named: "\(chocolate.id!)")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
