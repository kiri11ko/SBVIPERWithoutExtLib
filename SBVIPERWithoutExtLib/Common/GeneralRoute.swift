//
//  GeneralRoute.swift
//  VIPERSBCoreData
//
//  Created by Кирилл Лукьянов on 17.11.2019.
//  Copyright (c) 2019 Кирилл Лукьянов. All rights reserved.

import UIKit

enum GeneralRoute: IRouter, CaseIterable {

    case translate
    case history
    case sourceLanguage
    case main

}

extension CaseIterable where Self: Equatable {

    var index: Self.AllCases.Index? {
        return Self.allCases.firstIndex { self == $0 }
    }
}

extension GeneralRoute {
    var module: UIViewController? {

        switch self {
        case .sourceLanguage:
            return SourceLanguageRouter.createModule()
        case .main:
            return MainTabBarRouter.createModule()
        case .translate:
            return TranslateRouter.createModule()
        case .history:
            return HistoryRouter.createModule()
        }

    }
}
