//
//  JSONService.swift
//  SBVIPERWithoutExtLib
//
//  Created by Кирилл Лукьянов on 16.12.2019.
//  Copyright © 2019 Кирилл Лукьянов. All rights reserved.
//

import Foundation

class JSONService: JSONManager {
    func decode<T: Decodable>(type: T.Type, data: Data) -> (T?, Error?) {
        var responseModel: T?
        var responseError: Error?
        let jsonDecoder = JSONDecoder()
        do {
            responseModel = try jsonDecoder.decode(T.self, from: data)
        } catch let error {
            responseError = error
        }
        return (responseModel, responseError)
    }
    func coder<T: Encodable>(type: T.Type, data: T) -> (Data?, Error?) {
        var responseModel: Data?
        var responseError: Error?
        let jsonEncoder = JSONEncoder()
        do {
            responseModel = try jsonEncoder.encode(data)
        } catch let error {
            responseError = error
        }
        return (responseModel, responseError)
    }
}
