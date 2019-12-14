//
//  HistoryProtocols.swift
//  VIPERSBCoreData
//
//  Created Кирилл Лукьянов on 17.11.2019.
//  Copyright © 2019 Кирилл Лукьянов. All rights reserved.


import Foundation

// MARK: Wireframe -
protocol HistoryWireframeProtocol: class {

}
// MARK: Presenter -
protocol HistoryPresenterProtocol: class {
    var interactor: HistoryInteractorProtocol? { get set }
    func initializeFetchedResultsController()
    func numberOfSection() -> Int
    func numberOfRowsInSection(section: Int) -> Int
    func getObjects(index: IndexPath) -> AnyObject
}

// MARK: Interactor -
protocol HistoryInteractorProtocol: class {
  var presenter: HistoryPresenterProtocol? { get set }
    func initializeFetchedResultsController()
    func getObjects(index: IndexPath) -> AnyObject
    func numberOfSection() -> Int
    func numberOfRowsInSection(section: Int) -> Int
}

// MARK: View -
protocol HistoryViewProtocol: class {
  var presenter: HistoryPresenterProtocol? { get set }
}
