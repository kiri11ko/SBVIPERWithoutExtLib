//
//  SBVIPERWithoutExtLibTests.swift
//  SBVIPERWithoutExtLibTests
//
//  Created by Кирилл Лукьянов on 14.12.2019.
//  Copyright © 2019 Кирилл Лукьянов. All rights reserved.
//

import XCTest
@testable import SBVIPERWithoutExtLib

class SourceLanguageModuleTests: XCTestCase {
    var sourceLanguageView: SourceLanguageViewController? = nil
    override func setUp() {
        sourceLanguageView = SourceLanguageRouter.createModule() as? SourceLanguageViewController
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testLinks() {     
        XCTAssertNotNil(sourceLanguageView)
        XCTAssertNotNil(sourceLanguageView!.presenter)
        XCTAssertNotNil(sourceLanguageView!.presenter!.interactor)

    }
    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
}
