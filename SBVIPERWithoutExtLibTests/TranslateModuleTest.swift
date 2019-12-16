//
//  TranslateTest.swift
//  SBVIPERWithoutExtLibTests
//
//  Created by Кирилл Лукьянов on 16.12.2019.
//  Copyright © 2019 Кирилл Лукьянов. All rights reserved.
//

import XCTest
@testable import SBVIPERWithoutExtLib
class TranslateModuleTest: XCTestCase {
    var translateView: TranslateViewController?
    override func setUp() {
        translateView = TranslateRouter.createModule() as? TranslateViewController
    }
    override func tearDown() {
        translateView = nil
    }
    func testLinks() {
        XCTAssertNotNil(translateView)
        XCTAssertNotNil(translateView!.presenter)
        XCTAssertNotNil(translateView!.presenter!.interactor)
        XCTAssertNotNil(translateView!.presenter!.interactor!.coredata)
        XCTAssertNotNil(translateView!.presenter!.interactor!.network)
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
