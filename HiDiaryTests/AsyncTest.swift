//
//  AsyncTest.swift
//  HiDiaryTests
//
//  Created by TanakaHirokazu on 2021/08/07.
//

import XCTest

func asyncString(completion: ((String) -> Void)?) { DispatchQueue.global().async {
    sleep(3)
    completion?("文字列A")
}
}

class AsyncTests: XCTestCase {
    func testAsyncString() {
        asyncString {string in
            XCTAssertEqual(string, "文字列AB")

        }

    }

}

class AsyncTest: XCTestCase {

    func testAsyncString() {
        let exp = XCTestExpectation(description: "Async String")

        asyncString { string in
            XCTAssertEqual(string, "文字列A")
            exp.fulfill()
        }

        wait(for: [exp], timeout: 5.0)

    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

enum OperationError: Error { case divisionByZero }

func divide(_ x: Int, by y: Int) throws -> Int {

    if y == 0 {

        throw OperationError.divisionByZero

    }

    return x / y

}

class ExceptionTests: XCTestCase {
    func testDivideWhenDivisionByZero() {
        XCTAssertThrowsError(try divide(3, by: 0)) {error in
            let error = error as? OperationError
            XCTAssertEqual(error, OperationError.divisionByZero)
        }

    }
}
