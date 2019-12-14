//
//  SBVIPERWithoutExtLibTests.swift
//  SBVIPERWithoutExtLibTests
//
//  Created by Кирилл Лукьянов on 14.12.2019.
//  Copyright © 2019 Кирилл Лукьянов. All rights reserved.
//

import XCTest
@testable import SBVIPERWithoutExtLib

class SBVIPERWithoutExtLibTests: XCTestCase {
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testLinks() {
        //given
        let mainView: MainTabBarViewController?
        let sourceLanguageView: SourceLanguageViewController?
        let historyView: HistoryViewController?
        let translateView: TranslateViewController?
        //when
        mainView = MainTabBarRouter.createModule() as? MainTabBarViewController
        sourceLanguageView = SourceLanguageRouter.createModule() as? SourceLanguageViewController
        historyView = HistoryRouter.createModule() as? HistoryViewController
        translateView = TranslateRouter.createModule() as? TranslateViewController
        //then
        XCTAssertNotNil(mainView)
        XCTAssertNotNil(mainView!.presenter)
        XCTAssertNotNil(mainView!.presenter!.interactor)
        XCTAssertEqual(mainView?.viewControllers?.count, 3)
        XCTAssertNotNil(sourceLanguageView)
        XCTAssertNotNil(sourceLanguageView!.presenter)
        XCTAssertNotNil(sourceLanguageView!.presenter!.interactor)
        XCTAssertNotNil(historyView)
        XCTAssertNotNil(historyView!.presenter)
        XCTAssertNotNil(historyView!.presenter!.interactor)
        XCTAssertNotNil(translateView)
        XCTAssertNotNil(translateView!.presenter)
        XCTAssertNotNil(translateView!.presenter!.interactor)
        
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
}
