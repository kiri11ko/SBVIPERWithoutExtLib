//
//  HistoryPresenter.swift
//  VIPERSBCoreData
//
//  Created Кирилл Лукьянов on 17.11.2019.
//  Copyright © 2019 Кирилл Лукьянов. All rights reserved.


import UIKit

class HistoryPresenter: HistoryPresenterProtocol {
    final func getObjects(index: IndexPath) -> AnyObject {
        return (interactor?.getObjects(index: index))!
    }
    func numberOfSection() -> Int {
        return interactor!.numberOfSection()
    }
    func numberOfRowsInSection(section: Int) -> Int {
        return interactor!.numberOfRowsInSection(section: section)
    }
    func initializeFetchedResultsController() {
        interactor?.initializeFetchedResultsController()
    }
    weak private var view: HistoryViewProtocol?
    var interactor: HistoryInteractorProtocol?
    private let router: HistoryWireframeProtocol

    init(interface: HistoryViewProtocol, interactor: HistoryInteractorProtocol?, router: HistoryWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}
