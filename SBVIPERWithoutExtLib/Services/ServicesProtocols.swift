//
//  ServicesProtocols.swift
//  SBVIPERWithoutExtLib
//
//  Created by Кирилл Лукьянов on 05.12.2019.
//  Copyright © 2019 Кирилл Лукьянов. All rights reserved.
//

import Foundation
import CoreData

protocol DataManager: class {
    func saveContext (model: TranslateEntity)
    var mainContext: NSManagedObjectContext {get}
}

protocol IEndpoint {
    var scheme: String? { get }
    var host: String {get}
    var path: String {get}
    var queryItems: [URLQueryItem]? { get }
}

protocol NetworkManager: class {
    func request<T: IEndpoint>(endpoint: T, completion: @escaping (Data?, Error?) -> Void)
}

protocol JSONManager: class {
    func decode<T: Decodable>(type: T.Type, data: Data) -> (T?, Error?)
    func coder<T: Encodable>(type: T.Type, data: T) -> (Data?, Error?)
}
