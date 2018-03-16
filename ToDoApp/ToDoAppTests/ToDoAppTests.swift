//
//  ToDoAppTests.swift
//  ToDoAppTests
//
//  Created by XCode on 3/15/18.
//  Copyright © 2018 MarkS. All rights reserved.
//

import XCTest
@testable import ToDoApp
var tester = todoModel()
class ToDoAppTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssert( (todoModel.init().todolist != nil))
        tester.todolist?.append("Buy food")
        tester.todolist?.append("Do dishes")
        tester.todolist?.append("Clean room")
        tester.todolist?.append("Drink water")
        XCTAssertEqual(tester.todolist?.contains("Buy food"),true)
        XCTAssertEqual(tester.todolist?.contains("Do dishes"),true)
        XCTAssertEqual(tester.todolist?.contains("Clean room"),true)
        XCTAssertEqual(tester.todolist?.contains("Drink water"),true)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
