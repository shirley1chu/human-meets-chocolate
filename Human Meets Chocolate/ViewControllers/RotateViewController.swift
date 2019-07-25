//
//  RotateViewController.swift
//  HumanMeetsChocolate
//
//  Created by Shirley Chu on 7/19/19.
//  Copyright © 2019 Shirley Chu. All rights reserved.
//

import UIKit
import Firebase

class RotateViewController: UIViewController {
    
    @IBOutlet weak var rotateImageView: UIImageView!
    @IBOutlet weak var enterButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        enterButton.layer.cornerRadius = 8
        
        rotateImageView.rotate360Degrees()
        
        var ref: DocumentReference? = nil
        let db = Firestore.firestore()
        ref = db.collection("users").addDocument(data: [
            "first": "Ada",
            "last": "Lovelace",
            "born": 1815
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
}

extension UIImageView {
    func rotate360Degrees(duration: CFTimeInterval = 100.0, completionDelegate: AnyObject? = nil) {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat.pi * 12
        rotateAnimation.duration = duration
        
        if let delegate: CAAnimationDelegate = completionDelegate as! CAAnimationDelegate? {
            rotateAnimation.delegate = delegate
        }
        self.layer.add(rotateAnimation, forKey: nil)
    }
}
