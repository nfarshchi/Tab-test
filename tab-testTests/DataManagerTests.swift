//
//  DataManagerTests.swift
//  tab-testTests
//
//  Created by Navid Saba on 12/11/21.
//

import XCTest
@testable import tab_test

class DataManagerTests: XCTestCase {
    
    var mockDataManager = DataManager()
    
    override func setUpWithError() throws {
        mockDataManager = DataManager()
    }
    
    // MARK: Read Data From local file
    func testReadDataWithWrongFileName() {
        let testBundle = Bundle(for: type(of: self))
        do {
            try mockDataManager.dataOfFile(fileName: "wrongFile", bundle: testBundle)
        } catch {
            XCTAssertEqual(error as! DataError, DataError.fileNotFound)
        }
    }
    
    func testReadDataWithCorrectFileNameAndBadData() {
        let testBundle = Bundle(for: type(of: self))
        do {
            try mockDataManager.dataOfFile(fileName: "MockQuestionsBadData", bundle: testBundle)
        } catch {
            XCTAssertEqual(error as! DataError, DataError.invalidData)
        }
    }
    
}
