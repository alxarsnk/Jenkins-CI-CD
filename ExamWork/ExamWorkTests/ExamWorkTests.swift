//
//  ExamWorkTests.swift
//  ExamWorkTests
//
//  Created by Александр Арсенюк on 21.01.2020.
//  Copyright © 2020 Александр Арсенюк. All rights reserved.
//

import XCTest
@testable import ExamWork

class ExamWorkTests: XCTestCase {

    func test_001() {
        let variable = true
        XCTAssert(variable, "Variable is true")
    }
    
    func test_002() {
        let variable = false
        XCTAssertFalse(variable, "Variable is true")
    }
    
    func test_003() {
        let variable1 = true
        let variable2 = true
        XCTAssertEqual(variable1, variable2)
    }
    
    func test_004() {
        let variable: Int? = nil
        XCTAssertNil(variable)
    }  
}
