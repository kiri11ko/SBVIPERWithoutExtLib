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

    func getTranslateData(endpoint: YandexLanguageEndpoint) {
        network.request(endpoint: endpoint) { [weak self] (data, error) in
            if  let error = error {
                self?.presenter?.showAlert(title: .error, message: error.localizedDescription)
                return
            }
            let jsonDecoder = JSONDecoder()
            do {
                var responseModel = try jsonDecoder.decode(TranslateEntity.self, from: data!)
                endpoint.queryItems?.forEach {
                    $0.name == "text" ? responseModel.source = $0.value : nil
                }
                self?.coredata.saveContext(model: responseModel)
                self?.presenter?.translateresult(wordTranslate: responseModel.text?.first ?? "")
            } catch let error {
                    self?.presenter?.showAlert(title: .error, message: error.localizedDescription)
                }

        }
    }
}
