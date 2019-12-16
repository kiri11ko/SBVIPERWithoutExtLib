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
    func showAlert(title: AlertsTitle, message: String)
}
// MARK: Presenter -
protocol TranslatePresenterProtocol: class {
    func changeLanguageModule()
    func trasnalteWrod(word: String)
    func showAlert(title: AlertsTitle, message: String)
    func translateresult(wordTranslate: String)
    var interactor: TranslateInteractorProtocol? { get set}
}

// MARK: Interactor -
protocol TranslateInteractorProtocol: class {

  var presenter: TranslatePresenterProtocol? { get set }
    var coredata: DataManager! {get set}
    var network: NetworkManager! { get set}
    var json: JSONManager! {get set}
    func getTranslateData(endpoint: YandexLanguageEndpoint)
}

// MARK: View -
protocol TranslateViewProtocol: class {

  var presenter: TranslatePresenterProtocol? { get set }
    func showAlert(alert: Any)
    func translateresult(wordTranslate: String)
}
