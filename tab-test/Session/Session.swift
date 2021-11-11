//
//  Session.swift
//  tab-test
//
//  Created by Navid on 11/11/21.
//

import Foundation

class Session: ObservableObject {
    
    @Published var questions: [Question]?
    @Published var currentScore: Int = 0
    
    @discardableResult
    func loadQuestions() -> [Question]? {
        if let questionsArray = DataManager().loadQuestions() {
            self.questions = questionsArray
        }
        return self.questions
    }
    
    @discardableResult
    func addToScore(_ value: Int) -> Int {
        self.currentScore = self.currentScore + value
        return self.currentScore
    }
}
