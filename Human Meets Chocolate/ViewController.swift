//
//  ViewController.swift
//  HumanMeetsChocoalte
//
//  Created by Shirley Chu on 7/8/19.
//  Copyright © 2019 Shirley Chu. All rights reserved.
//

import UIKit
import Foundation
import Koloda

class ViewController: UIViewController {
    

  
    
    @IBOutlet var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
//                if let json = ViewController.readJSONFromFile(fileName: "chocolate_data") as? [NSDictionary] {
//
//                textView.text = json[1]["About"] as? String
//                }
        
    }
    
    static func readJSONFromFile(fileName: String) -> Any?
    {
        var json: Any?
        if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
            do {
                let fileUrl = URL(fileURLWithPath: path)
                // Getting data from JSON file using the file URL
                let data = try Data(contentsOf: fileUrl, options: .mappedIfSafe)
                json = try? JSONSerialization.jsonObject(with: data)
            } catch {
                // Handle error here
            }
        }
        return json
    }
    
    
}



