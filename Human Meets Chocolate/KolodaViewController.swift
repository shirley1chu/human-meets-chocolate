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
        
        //        provides view to populate koloda view
        kolodaView.dataSource = self
        
        //        responds to kolodaview events
        kolodaView.delegate = self
        
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "left-arrow")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "left-arrow")
        navigationItem.largeTitleDisplayMode = .always
        
        kolodaView.layer.cornerRadius = 8
    }
    
    
    //MARK: IBActions
    @IBAction func leftButtonTapped() {
        kolodaView.swipe(.left)
    }
    
    @IBAction func rightButtonTapped() {
        kolodaView.swipe(.right)
    }
    //
    //    @IBAction func undoButtonTapped() {
    //        kolodaView?.revertAction()
    //    }
    
}



extension KolodaViewController: KolodaViewDelegate, KolodaViewDataSource {
    
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
//        koloda.resetCurrentCardIndex()
        //        show 'recommendations empty' page
        //        might need to use segue
        
        print("you have no more recommendations :(")
    }
    
    
    func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.chocolate = chocolates[index]
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    
    func koloda(_ koloda: KolodaView, didSwipeCardAt index: Int, in direction: SwipeResultDirection) {
        print("in this function")
        if direction == .left {
            print("left swipe")
            return
        }
        else if direction == .right {
            MatchesViewController.matches.append(chocolates[index])
            let alertController = UIAlertController(title: "Success!", message:
                "It's a match <3", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
            
            self.present(alertController, animated: true, completion: nil)
            return
        }
    }
    
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        let chocolateCard = Bundle.main.loadNibNamed("ChocolateCard",
                                                 owner: self, options: nil)?[0] as? ChocolateCard
        chocolateCard?.layer.cornerRadius = 8
        let chocolate = chocolates[index]
        chocolateCard?.chocolate = chocolate
        return chocolateCard!
    }
    
    
    func kolodaNumberOfCards(_ koloda:KolodaView) -> Int {
        return numberOfCards
    }
    
    
}

