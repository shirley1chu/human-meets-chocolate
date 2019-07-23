//
//  Chocolate.swift
//  HumanMeetsChocolate
//
//  Created by Shirley Chu on 7/10/19.
//  Copyright © 2019 Shirley Chu. All rights reserved.
//

import Foundation

class Chocolate: NSObject, Codable {
    
        var id: Int? 
        @objc var type: String?
        var flavor: String?
        @objc var brand: String?
        var notes: String?
        var about: String?
        var targetUser: String?
        var pricePoint: String?
        var specialFeatures: String?
    @objc var region: String?
    @objc var personality: String?
    
    enum CodingKeys : String, CodingKey {
        case id 
        case type
        case flavor
        case brand
        case notes
        case about
        case targetUser = "target_user"
        case pricePoint = "price_point"
        case specialFeatures = "special_features"
        case region
        case personality
    }
    

}
