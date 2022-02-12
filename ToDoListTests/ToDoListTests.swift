//
//  ToDoListTests.swift
//  ToDoListTests
//
//  Created by Max on 29.01.2022.
//

import XCTest
@testable import ToDoList

class ToDoListTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let presenter = ToDoList.ToDoItemPresenter(view: nil)
        XCTAssertEqual(presenter.saveTask(id: 0, dateStart: 10000, dateFinish: 9000, name: "test", taskDescription: "test"), false)
        XCTAssertEqual(presenter.saveTask(id: 0, dateStart: 10000, dateFinish: 19000, name: "", taskDescription: "test"), false)
        XCTAssertEqual(presenter.saveTask(id: 0, dateStart: 10000, dateFinish: 19000, name: "test", taskDescription: ""), false)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
