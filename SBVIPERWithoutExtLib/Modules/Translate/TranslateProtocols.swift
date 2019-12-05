//
//  TranslateProtocols.swift
//  VIPERSBCoreData
//
//  Created Кирилл Лукьянов on 17.11.2019.
//  Copyright © 2019 Кирилл Лукьянов. All rights reserved.


import Foundation

// MARK: Wireframe -
protocol TranslateWireframeProtocol: class {
    func showLanguageModule()
}
// MARK: Presenter -
protocol TranslatePresenterProtocol: class {
    func changeLanguageModule()
    func trasnalteWrod(word: String)

}

// MARK: Interactor -
protocol TranslateInteractorProtocol: class {

  var presenter: TranslatePresenterProtocol? { get set }
    func getTranslateData(endpoint: YandexLanguageEndpoint)
}

// MARK: View -
protocol TranslateViewProtocol: class {

  var presenter: TranslatePresenterProtocol? { get set }
}
