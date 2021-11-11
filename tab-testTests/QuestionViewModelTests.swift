//
//  QuestionViewModelTests.swift
//  tab-testTests
//
//  Created by Navid Saba on 12/11/21.
//

import XCTest
@testable import tab_test

class QuestionViewModelTests: XCTestCase {
    
    var mockSession = Session()
    var viewModel: QuestionViewModel!
    
    var mockQuestionWithTrueAnswer = Question(title: "title for question 1", answer: true)
    var mockQuestionWithFalseAnswer = Question(title: "title for question 2", answer: false)
    
    override func setUpWithError() throws {
        mockSession = Session()
        mockSession.questions = [mockQuestionWithTrueAnswer, mockQuestionWithFalseAnswer]
        viewModel = QuestionViewModel.init(session: mockSession)
    }
    
    func testInitialCurrentIndex() {
        XCTAssertEqual(viewModel.currentQuestionIndex, 0)
    }
    
    func testNextQuestion() {
        XCTAssertEqual(viewModel.currentQuestionIndex, 0)
        viewModel?.nextQuestion()
        XCTAssertEqual(viewModel.currentQuestionIndex, 1)
    }
    
    func testFinishState() {
        XCTAssertEqual(viewModel.currentQuestionIndex, 0)
        XCTAssertEqual(viewModel.state, .idle)
        viewModel?.nextQuestion()
        XCTAssertEqual(viewModel.currentQuestionIndex, 1)
        XCTAssertEqual(viewModel.state, .idle)
        viewModel?.nextQuestion()
        XCTAssertEqual(viewModel.currentQuestionIndex, 2)
        XCTAssertEqual(viewModel.state, .finished)
    }
    
    func testNavigationTitle() {
        XCTAssertEqual(viewModel.title, "Question 1")
        viewModel?.nextQuestion()
        XCTAssertEqual(viewModel.title, "Question 2")
    }
    
    func testCheckAnswerWithCorrectAnswer() {
        XCTAssertTrue(viewModel.checkAnswer(answer: .optionTrue, question: mockQuestionWithTrueAnswer))
        XCTAssertTrue(viewModel.checkAnswer(answer: .optionFalse, question: mockQuestionWithFalseAnswer))
    }
    
    func testCheckAnswerWithWrongAnswer() {
        XCTAssertFalse(viewModel.checkAnswer(answer: .optionTrue, question: mockQuestionWithFalseAnswer))
        XCTAssertFalse(viewModel.checkAnswer(answer: .optionFalse, question: mockQuestionWithTrueAnswer))
    }
    
    func testAnswerStatusTitle() {
        XCTAssertEqual(viewModel.answerStatusTitle(for: true), "Your answer is right")
        XCTAssertEqual(viewModel.answerStatusTitle(for: false), "Your answer is wrong")
    }
    
    func testScoreIncreaseAfterCorrectAnswer() {
        XCTAssertEqual(viewModel.currentQuestionIndex, 0)
        XCTAssertEqual(viewModel.session.currentScore, 0)
        viewModel.answerdWith(option: .optionTrue)
        XCTAssertEqual(viewModel.session.currentScore, 1)
    }
    
    func testScoreNotIncreaseAfterWrongAnswer() {
        XCTAssertEqual(viewModel.currentQuestionIndex, 0)
        XCTAssertEqual(viewModel.session.currentScore, 0)
        viewModel.answerdWith(option: .optionFalse)
        XCTAssertEqual(viewModel.session.currentScore, 0)
    }
    
    func testQuestionTitle() {
        XCTAssertEqual(viewModel.questionTitle, "title for question 1")
        viewModel.nextQuestion()
        XCTAssertEqual(viewModel.questionTitle, "title for question 2")
    }
}
