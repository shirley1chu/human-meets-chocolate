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
    
    //MARK: IBActions
//    @IBAction func leftButtonTapped() {
//        kolodaView?.swipe(SwipeResultDirection.Left)
//        kolodaView?.swipeLeft()
//    }
    
//    @IBAction func rightButtonTapped() {
//        swipeRight()
//    }
//
//    @IBAction func undoButtonTapped() {
//        kolodaView?.revertAction()
//    }
    
}



extension KolodaViewController: KolodaViewDelegate {
    
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        koloda.resetCurrentCardIndex()
//        show 'recommendations empty' page
//        might need to use segue 
    }
    
    
    func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
        //        delete all the crap below and add segue, loads show page
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.imagetoLoad = UIImage(named: "\(index + 1)")
            vc.chocolate = chocolates[index]
            navigationController?.pushViewController(vc, animated: true)
        }
            
            
//        let alert = UIAlertController(title: "Congratulations!", message: "Now you're at a card \(index + 1)", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "OK", style: .default))
//        self.present(alert, animated: true)
    }
    
//    func swipeLeft() { 
//        print("left swipe")
//    }
////
//    func swipeRight () {
//        print("right swipe")
//    }
}

extension KolodaViewController: KolodaViewDataSource {
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        let photoView = Bundle.main.loadNibNamed("ChocolateCard",
                                                 owner: self, options: nil)?[0] as? ChocolateCard
        let chocolate = chocolates[index]
        
        photoView?.imageView?.image = UIImage(named: "\(index + 1)")
        photoView?.chocolate = chocolate
        return photoView!
    }
    
    
    
    func kolodaNumberOfCards(_ koloda:KolodaView) -> Int {
        return numberOfCards
    }
    
    

}
