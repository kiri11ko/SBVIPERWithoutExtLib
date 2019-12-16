//
//  MainModuleTests.swift
//  SBVIPERWithoutExtLibTests
//
//  Created by Кирилл Лукьянов on 16.12.2019.
//  Copyright © 2019 Кирилл Лукьянов. All rights reserved.
//

import XCTest
@testable import SBVIPERWithoutExtLib
class MainModuleTests: XCTestCase {
    var mainView: MainTabBarViewController? = nil
    override func setUp() {
         mainView = MainTabBarRouter.createModule() as? MainTabBarViewController
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        mainView = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        XCTAssertNotNil(mainView)
        XCTAssertNotNil(mainView!.presenter)
        XCTAssertNotNil(mainView!.presenter!.interactor)
        XCTAssertEqual(mainView?.viewControllers?.count, 3)
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
