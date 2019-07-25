//
//  KolodaViewController.swift
//  HumanMeetsChocolate
//
//  Created by Shirley Chu on 7/9/19.
//  Copyright © 2019 Shirley Chu. All rights reserved.
//

import UIKit
import Koloda
import SwiftyGif

class KolodaViewController: UIViewController {
    
    @IBOutlet var kolodaView: KolodaView!
    
    @IBOutlet weak var emptyGifView: UIImageView!
    
    let chocolates = chocolateCollection().chocolates
    
    var recommendations: [Chocolate]!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        provides view to populate koloda view
        kolodaView.dataSource = self
        
        //        responds to kolodaview events
        kolodaView.delegate = self
        
        navigationItem.largeTitleDisplayMode = .always
        
        kolodaView.layer.cornerRadius = 8
        let gif = try? UIImage(gifName: "crying-gif.gif")
        emptyGifView.setGifImage(gif!)
        print("koloda recommendations: \(recommendations)")
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
        
    }
    
    
    func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.chocolate = recommendations[index]
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    
    func koloda(_ koloda: KolodaView, didSwipeCardAt index: Int, in direction: SwipeResultDirection) {
        if direction == .left {
            return
        }
        else if direction == .right {
            MatchesViewController.matches.append(recommendations[index])
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
        let chocolate = recommendations[index]
        chocolateCard?.chocolate = chocolate
        return chocolateCard!
    }
    
    
    func kolodaNumberOfCards(_ koloda:KolodaView) -> Int {
        return recommendations.count
    }
    
    
}

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
    mutating func capitalize() {
        self = self.capitalizingFirstLetter()
    }
}
