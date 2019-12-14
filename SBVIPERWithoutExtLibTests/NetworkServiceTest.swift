//
//  NetworkServiceTest.swift
//  SBVIPERWithoutExtLibTests
//
//  Created by Кирилл Лукьянов on 14.12.2019.
//  Copyright © 2019 Кирилл Лукьянов. All rights reserved.
//

import XCTest
@testable import SBVIPERWithoutExtLib
class NetworkServiceTest: XCTestCase {
    var network: NetworkManager!
    var yandexEndpoint: YandexLanguageEndpoint!
    override func setUp() {
        yandexEndpoint = YandexLanguageEndpoint.yandex(parameter: ["text": "word"])
        self.network = NetworkService()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        //given
        let expect = expectation(description: "network request")
        //when
        network.request(endpoint: yandexEndpoint) { (data, error) in
            if  error != nil {
                XCTFail("Network error: \(error!.localizedDescription)")
            }
            if data == nil {
                 XCTFail("Network error: nil data")
            }
            expect.fulfill()
        }
        //then
        waitForExpectations(timeout: 1) { (error) in
            if  error != nil {
                XCTFail("Expect not full fill")
            }
        }
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
