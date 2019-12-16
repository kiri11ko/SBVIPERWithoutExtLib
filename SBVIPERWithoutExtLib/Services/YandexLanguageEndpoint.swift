//
//  YandexLanguageEndpoint.swift
//  VIPERSBCoreData
//
//  Created by Кирилл Лукьянов on 19.11.2019.
//  Copyright (c) 2019 Кирилл Лукьянов. All rights reserved.

import Foundation

enum YandexLanguageEndpoint {
    case yandex(parameter: [String: String])
}

extension YandexLanguageEndpoint: IEndpoint {
    var scheme: String? {
        switch self {
        case .yandex:
            return "https"
        }
    }
    var host: String {
        switch self {
        case .yandex:
            return "translate.yandex.net"
        }
    }
    var path: String {
        switch self {
        case .yandex:
            return "/api/v1.5/tr.json/translate"
        }
    }
    var queryItems: [URLQueryItem]? {
        switch self {
        case .yandex(let model):
            let key = "trnsl.1.1.20191119T111752Z.69ccba57e0a873b8.9a635ffad66da2441a1cd4b03f1753a9eef83c46"
            var queryItems: [URLQueryItem] = [URLQueryItem(name: "key",
                                                           value: key),
                                              URLQueryItem(name: "lang", value: "en-ru"),
                                              URLQueryItem(name: "format", value: "plain")]
            model.forEach {
                let item = URLQueryItem(name: $0.key, value: $0.value)
                queryItems.append(item)
            }
            return queryItems
        }
    }
}
