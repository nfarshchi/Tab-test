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
    
    init() {
        do {
            try loadQuestions(with: "swiftQuestions")
        } catch {
            if let dataError = error as? DataError {
                NSLog("cannot read data from file: \(dataError.errorDescription)")
            } else {
                fatalError("unexpected error \(error.localizedDescription)")
            }
        }
    }
    
    func loadQuestions(with fileName: String, bundle: Bundle = .main) throws {
        let dataManager = DataManager()
        do {
            let data = try dataManager.dataOfFile(fileName: fileName, bundle: bundle)
            dataManager.loadData(of: Questions.self, from: data) { result in
                switch result {
                case .success(let questions):
                    self.questions = questions.items
                case .failure(let error):
                    fatalError(error.errorDescription)
                }
            }
        }
    }
    
    func shouldIncreaseScore(answer: Bool) {
        self.currentScore += answer ? 1 : 0
    }
    
    func resetScore() {
        self.currentScore = 0
    }    
}
