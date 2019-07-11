//
//  KolodaViewController.swift
//  HumanMeetsChocolate
//
//  Created by Shirley Chu on 7/9/19.
//  Copyright © 2019 Shirley Chu. All rights reserved.
//

import UIKit
import Koloda

class KolodaViewController: UIViewController {

    @IBOutlet var kolodaView: KolodaView!
    
    let chocolates = chocolateCollection().chocolates
    
    private let numberOfCards = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(chocolates)
//        provides view to populate koloda view
        kolodaView.dataSource = self
        
//        responds to kolodaview events
        kolodaView.delegate = self
    }
    
}

extension KolodaViewController: KolodaViewDelegate {
    
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        koloda.resetCurrentCardIndex()
//        show 'recommendations empty' page
//        might need to use segue 
    }
    
    
    func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
        //        delete all the crap below and add segue, loads show page
        let alert = UIAlertController(title: "Congratulations!", message: "Now you're at a card \(index + 1)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
//    func swipeLeft() {
////        delete from recommendations
//    }
//
//    func swipeRight () {
////        add to matches class
//    }
}

extension KolodaViewController: KolodaViewDataSource {
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        let photoView = Bundle.main.loadNibNamed("ChocolateCard",
                                                 owner: self, options: nil)?[0] as? ChocolateCard
        let chocolate = chocolates[index]
        
        photoView?.imageView?.image = UIImage(named: "\(index + 1)")
        photoView?.chocolate = chocolate
//        photoView?.brand.text = chocolate.brand
//        photoView?.flavor.text = chocolate.flavor
//        photoView?.type.text = chocolate.type
        
        return photoView!
    }
    
    
    
    func kolodaNumberOfCards(_ koloda:KolodaView) -> Int {
        return numberOfCards
    }
    
    
    
//    func kolodaViewForCardAtIndex(koloda: KolodaView, index: UInt) -> UIView {
//        let photoView = NSBundle.mainBundle().loadNibNamed("KolodaPhotoView",
//                                                           owner: self, options: nil)[0] as? KolodaPhotoView
//        let photo = photos[Int(index)]
//        photoView?.photoImageView?.imageFromUrl(photo.photoUrlString)
//        photoView?.photoTitleLabel?.text = photo.title
//        return photoView!
//    }

    
    

}
