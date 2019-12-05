//
//  TranslateInteractor.swift
//  VIPERSBCoreData
//
//  Created Кирилл Лукьянов on 17.11.2019.
//  Copyright © 2019 Кирилл Лукьянов. All rights reserved.

import UIKit

class TranslateInteractor: TranslateInteractorProtocol {
    weak var presenter: TranslatePresenterProtocol?
    let network = NetworkService()
    let alert = AlertsService()
    let coredata = CoreDataService()

    func getTranslateData(endpoint: YandexLanguageEndpoint) {

        network.request(endpoint: endpoint) { [weak self] (data, error) in
            if  let error = error {
                self?.alert.showAlert(title: .error, message: error.localizedDescription).show()
            }
            let jsonDecoder = JSONDecoder()
            do {
            let responseModel = try jsonDecoder.decode(TranslateEntity.self, from: data!)
                self?.coredata.saveContext(model: responseModel)

            } catch let error {
                    self?.alert.showAlert(title: .error, message: error.localizedDescription).show()
                }

        }
    }

}
