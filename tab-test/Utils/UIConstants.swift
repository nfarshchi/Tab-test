//
//  UIConstants.swift
//  tab-test
//
//  Created by Navid on 11/11/21.
//

import Foundation
import UIKit

// MARK: Spacing
struct Gutter {
    static let small: CGFloat = 4
    static let normal: CGFloat = 8
    static let large: CGFloat = 16
    static let xlarge: CGFloat = 20
}

// MARK: String keys
struct Strings {
    struct LandingView {
        static let score = "landing-view.score"
        static let play = "landing-view.play.cta.title"
    }
    
    struct QuestionView {
        static let title = "question-view.title"
        static let dismissCTA = "question-view.cta.dismiss"
        static let answerCTAOptionA = "question-view.cta.answer.option-a"
        static let answerCTAOptionB = "question-view.cta.answer.option-b"
        
        struct Result {
            static let title = "question-view.result"
            static let correct = "question-view.result.correct"
            static let wrong = "question-view.result.wrong"
            static let nextCTA = "question-view.cta.next"
        }
    }
}
