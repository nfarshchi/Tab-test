//
//  SessionTests.swift
//  tab-testTests
//
//  Created by Navid on 11/11/21.
//

import XCTest
@testable import tab_test

class SessionTests: XCTestCase {
    
    var mockSession = Session()
    
    override func setUpWithError() throws {
        mockSession = Session()
    }
    
    // MARK: Score tests
    func testInitialScore() {
        XCTAssertEqual(mockSession.currentScore, 0)
    }
    
    func testAddScoreWithTrueAnswer() {
        mockSession.shouldIncreaseScore(answer: true)
        XCTAssertEqual(mockSession.currentScore, 1)
    }
    
    func testAddScoreWithFalseAnswer() {
        mockSession.shouldIncreaseScore(answer: false)
        XCTAssertEqual(mockSession.currentScore, 0)
    }
    
    func testResetScore() {
        mockSession.currentScore = 10
        XCTAssertNotEqual(mockSession.currentScore, 0)
        mockSession.resetScore()
        XCTAssertEqual(mockSession.currentScore, 0)
    }
    
    // MARK: Read Questions From local file
    func testReadDataWithWrongFileName() {
        let testBundle = Bundle(for: type(of: self))
        do {
            try mockSession.loadQuestions(with: "wrongFile", bundle: testBundle)
        } catch {
            XCTAssertEqual(error as! DataError, DataError.fileNotFound)
        }
    }
    
    // TODO: Good to have tests for corrupted files or not matching model object
}
