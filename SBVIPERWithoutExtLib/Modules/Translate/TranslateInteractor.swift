//
//  TranslateInteractor.swift
//  VIPERSBCoreData
//
//  Created Кирилл Лукьянов on 17.11.2019.
//  Copyright © 2019 Кирилл Лукьянов. All rights reserved.

import UIKit
    class TranslateInteractor: TranslateInteractorProtocol {
        weak var presenter: TranslatePresenterProtocol?
        var network: NetworkManager!
        var coredata: DataManager!
        var json: JSONManager!
        func getTranslateData(endpoint: YandexLanguageEndpoint) {
            network.request(endpoint: endpoint) { [weak self] (data, error) in
                if  let error = error {
                    self?.presenter?.showAlert(title: .error, message: error.localizedDescription)
                    return
                }
                let response = self?.json.decode(type: TranslateEntity.self, data: data!)
                if let error = response?.1 {
                    self?.presenter?.showAlert(title: .error, message: error.localizedDescription)
                }
                guard var responseModel = response?.0 else { return }
                    endpoint.queryItems?.forEach {
                        $0.name == "text" ? responseModel.source = $0.value : nil
                    }
                self?.coredata.saveContext(model: responseModel)
                self?.presenter?.translateresult(wordTranslate: responseModel.text?.first ?? "")
            }
        }
}
