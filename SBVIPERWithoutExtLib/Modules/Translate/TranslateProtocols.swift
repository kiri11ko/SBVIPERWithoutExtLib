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
    func showAlertTextCountError()
    func translateresult(wordTranslate: String)

}

// MARK: Interactor -
protocol TranslateInteractorProtocol: class {

  var presenter: TranslatePresenterProtocol? { get set }
    var coredata: DataManager! {get set}
    var network: NetworkManager! { get set}
    func getTranslateData(endpoint: YandexLanguageEndpoint)
    func makeAlert(style: AlertsTitle, text: String) -> Any
}

// MARK: View -
protocol TranslateViewProtocol: class {

  var presenter: TranslatePresenterProtocol? { get set }
    func showAlert(alert: Any)
    func translateresult(wordTranslate: String)
}
