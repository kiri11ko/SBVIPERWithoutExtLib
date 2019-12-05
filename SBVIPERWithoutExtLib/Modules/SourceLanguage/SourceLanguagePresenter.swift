//
//  SourceLanguagePresenter.swift
//  VIPERSBCoreData
//
//  Created Кирилл Лукьянов on 17.11.2019.
//  Copyright © 2019 Кирилл Лукьянов. All rights reserved.


import UIKit

class SourceLanguagePresenter: SourceLanguagePresenterProtocol {

    weak private var view: SourceLanguageViewProtocol?
    var interactor: SourceLanguageInteractorProtocol?
    private let router: SourceLanguageWireframeProtocol

    init(interface: SourceLanguageViewProtocol,
         interactor: SourceLanguageInteractorProtocol?,
         router: SourceLanguageWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

    func getLanguageList() -> [String] {
        return ["Russian", "English", "Deaushe"]
    }

}
