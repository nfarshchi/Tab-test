//
//  QuestionViewModel.swift
//  tab-test
//
//  Created by Navid Saba on 12/11/21.
//

import Foundation
import Combine

class QuestionViewModel: ObservableObject {
    typealias Rs = Strings.QuestionView
    let session: Session
    @Published private(set) var state: State = .idle
    @Published private(set) var currentQuestionIndex: Int = 0
    @Published private(set) var title: String = ""
    @Published private(set) var questionTitle: String = ""
    @Published private(set) var answerStatusTitle: String = ""
    @Published private(set) var showFinishedState: Bool = false
    @Published private(set) var showAnsweringBlock: Bool = false
    @Published private(set) var showAnswerStatusBlock: Bool = false
    
    enum State {
        case idle
        case answered
        case finished
    }
    
    private var bag: [AnyCancellable] = []
    
    init(session: Session) {
        self.session = session
        self.bindScreenValues()
    }
    
    deinit {
        bag.removeAll()
    }
    
    private func bindScreenValues() {
        $currentQuestionIndex.sink { [weak self] index in
            self?.title = String(format: Rs.title.localized, (index + 1))
        }.store(in: &bag)
        
        $currentQuestionIndex.map { [weak self] index in
            guard let questions = self?.session.questions,
                  index < questions.count
            else {
                self?.state = .finished
                return ""
            }
            return questions[index].title
        }.assign(to: &$questionTitle)
        
        $state.map { $0 == .finished }
        .assign(to: &$showFinishedState)
        
        $state.map { $0 == .idle }
        .assign(to: &$showAnsweringBlock)
        
        $state.map { $0 == .answered }
        .assign(to: &$showAnswerStatusBlock)
    }
    
    func nextQuestion() {
        guard let questions = self.session.questions,
              currentQuestionIndex < questions.count
        else {
            self.state = .finished
            return
        }
        self.state = .idle
        currentQuestionIndex += 1
    }
    
    func answerdWith(option: AnswerOption) {
        guard let currentQuestion = self.session.questions?[currentQuestionIndex] else { fatalError("Unexpected error") }
        self.state = .answered
        let answer = checkAnswer(answer: option, question: currentQuestion)
        self.answerStatusTitle = answerStatusTitle(for: answer)
        self.session.shouldIncreaseScore(answer: answer)
    }
    
    func answerStatusTitle(for answer: Bool) -> String {
        let answerText = answer ?
        Rs.Result.correct.localized : Rs.Result.wrong.localized
        return String(format: Rs.Result.title.localized, answerText)
    }
    
    func checkAnswer(answer: AnswerOption, question: Question) -> Bool {
        switch answer {
        case .optionTrue:
            return question.answer
        case .optionFalse:
            return !question.answer
        }
    }
    
    enum AnswerOption {
        case optionTrue, optionFalse
    }
}
