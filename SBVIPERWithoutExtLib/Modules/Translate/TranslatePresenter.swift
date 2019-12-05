//
//  TranslatePresenter.swift
//  VIPERSBCoreData
//
//  Created Кирилл Лукьянов on 17.11.2019.
//  Copyright © 2019 Кирилл Лукьянов. All rights reserved.
//
//  

import UIKit

class TranslatePresenter: TranslatePresenterProtocol {

    weak private var view: TranslateViewProtocol?
    var interactor: TranslateInteractorProtocol?
    private let router: TranslateWireframeProtocol

    init(interface: TranslateViewProtocol,
         interactor: TranslateInteractorProtocol?,
         router: TranslateWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

    func trasnalteWrod(word: String) {
        let yandexEndpoint = YandexLanguageEndpoint.yandex(parameter: ["text": word])
        interactor?.getTranslateData(endpoint: yandexEndpoint)
    }

    func changeLanguageModule() {
        router.showLanguageModule()
    }
    func showAlertTextCountError() {
        let alert: Any = interactor?.makeAlert(style: .error,
                                               text: "Error, input minimum 3 characters.") as Any
        view?.showAlert(alert: alert)
    }
    func translateresult(wordTranslate: String) {
        view?.translateresult(wordTranslate: wordTranslate)
    }

}
