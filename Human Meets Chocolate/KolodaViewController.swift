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
        //        kolodaView?.swipe(SwipeResultDirection.Left)
        //        kolodaView?.swipeLeft()
        print("goodbye world")
        kolodaView.swipe(.left)

    }
    
    @IBAction func rightButtonTapped() {
        print("hello world")
        kolodaView.swipe(.right)
    }
    //
    //    @IBAction func undoButtonTapped() {
    //        kolodaView?.revertAction()
    //    }
    
}



extension KolodaViewController: KolodaViewDelegate, KolodaViewDataSource {
    
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        koloda.resetCurrentCardIndex()
        //        show 'recommendations empty' page
        //        might need to use segue
    }
    
    
    func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.imagetoLoad = UIImage(named: "\(index + 1)")
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
            print("right swipe")
            if let matchesController = storyboard?.instantiateViewController(withIdentifier: "MatchesController") as? MatchesViewController {
                matchesController.matches.append(chocolates[index])
            }
            return
        }
    }
    
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        let photoView = Bundle.main.loadNibNamed("ChocolateCard",
                                                 owner: self, options: nil)?[0] as? ChocolateCard
        photoView?.layer.cornerRadius = 8
        let chocolate = chocolates[index]
        
        photoView?.imageView?.image = UIImage(named: "\(index + 1)")
        photoView?.imageView.layer.cornerRadius = 8
        photoView?.chocolate = chocolate
        return photoView!
    }
    
    
    func kolodaNumberOfCards(_ koloda:KolodaView) -> Int {
        return numberOfCards
    }
    
    
}

