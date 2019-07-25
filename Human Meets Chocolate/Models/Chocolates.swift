//
//  Chocolates.swift
//  HumanMeetsChocolate
//
//  Created by Shirley Chu on 7/10/19.
//  Copyright © 2019 Shirley Chu. All rights reserved.
//

import Foundation

class chocolateCollection {
    
    var chocolates: [Chocolate] = []
    
    init () {
        self.chocolates = makeChocolates()
    }
    
}

extension chocolateCollection {
    
    func makeChocolates () -> [Chocolate] {
        var chocolates: [Chocolate] = []
        
        let path = Bundle.main.url(forResource: "chocolate_data", withExtension: "json")
        let chocolateData = try? Data(contentsOf: path!)
        
        
            let jsonDecoder = JSONDecoder()
            do {
                chocolates = try jsonDecoder.decode([Chocolate].self, from: chocolateData!)
                
            }
            catch {
                print("failed to load chocolates")
                print(error.localizedDescription)
            }
        return chocolates
    }
}
