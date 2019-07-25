//
//  QuestionData.swift
//  HumanMeetsChocolate
//
//  Created by Shirley Chu on 7/22/19.
//  Copyright © 2019 Shirley Chu. All rights reserved.
//

import Foundation

struct Question {
    var text: String
    var attribute: String
    var answers: [Answer]
}


struct Answer {
    var text: String
    var value: String
}
