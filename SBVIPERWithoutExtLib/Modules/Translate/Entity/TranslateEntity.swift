//
//  NetworkService.swift
//  VIPERSBCoreData
//
//  Created by Кирилл Лукьянов on 19.11.2019.
//  Copyright (c) 2019 Кирилл Лукьянов. All rights reserved.


import Foundation

struct TranslateEntity: Codable {
	let code: Int?
	let lang: String?
	let text: [String]?
    var source: String?
	enum CodingKeys: String, CodingKey {

		case code
		case lang
		case text
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		code = try values.decodeIfPresent(Int.self, forKey: .code)
		lang = try values.decodeIfPresent(String.self, forKey: .lang)
		text = try values.decodeIfPresent([String].self, forKey: .text)
	}

}
