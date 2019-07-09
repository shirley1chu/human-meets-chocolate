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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        kolodaView.dataSource = self
        kolodaView.delegate = self
    }
    
}

extension KolodaViewController: KolodaViewDelegate {
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        koloda.reloadData()
    }
    
    func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
        let alert = UIAlertController(title: "Congratulation!", message: "Now you're at a card)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
}
extension KolodaViewController: KolodaViewDataSource {
    
    func kolodaNumberOfCards(_ koloda:KolodaView) -> Int {
        return 1
    }
    
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        let view = UIImageView(image: UIImage(named: "1"))
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        return view
    }
}
