//
//  Question.swift
//  tab-test
//
//  Created by Navid on 11/11/21.
//

import Foundation

struct Question: Codable {
    let title: String
    let answer: Bool
    
    enum CodingKeys: String, CodingKey {
        case title = "question"
        case answer
    }
}

struct Questions: Codable {
    var domain: String
    var items: [Question]
    
    enum CodingKeys: String, CodingKey {
        case items = "questions"
        case domain
    }
}
