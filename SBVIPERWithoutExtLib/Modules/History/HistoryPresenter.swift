//
//  HistoryPresenter.swift
//  VIPERSBCoreData
//
//  Created Кирилл Лукьянов on 17.11.2019.
//  Copyright © 2019 Кирилл Лукьянов. All rights reserved.


import UIKit

class HistoryPresenter: HistoryPresenterProtocol {

    weak private var view: HistoryViewProtocol?
    var interactor: HistoryInteractorProtocol?
    private let router: HistoryWireframeProtocol

    init(interface: HistoryViewProtocol, interactor: HistoryInteractorProtocol?, router: HistoryWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

}
