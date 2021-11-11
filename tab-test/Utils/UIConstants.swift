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
/// TODO: There is a library RSwift which read the localization strings and create
///       these keys, for this project I didnt want to use thirdparty library so I created them here manually
///
struct Strings {
    struct LandingView {
        static let score = "landing-view.score"
        static let play = "landing-view.play.cta.title"
    }
    
    struct QuestionView {
        static let title = "question-view.title"
        static let dismissCTA = "question-view.cta.dismiss"
        static let answerCTAOptionTrue = "question-view.cta.answer.option-true"
        static let answerCTAOptionFalse = "question-view.cta.answer.option-false"
        static let nextCTA = "question-view.cta.next"
        
        struct Result {
            static let title = "question-view.result"
            static let correct = "question-view.result.correct"
            static let wrong = "question-view.result.wrong"
            static let nextCTA = "question-view.cta.next"
        }
        
        struct EndGameMessage {
            static let title = "end-message.title"
            static let body = "end-message.body"
            static let finishCTA = "end-message.cta.finish"
        }
    }
}
