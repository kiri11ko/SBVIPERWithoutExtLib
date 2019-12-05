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

}

// MARK: Interactor -
protocol HistoryInteractorProtocol: class {

  var presenter: HistoryPresenterProtocol? { get set }
}

// MARK: View -
protocol HistoryViewProtocol: class {

  var presenter: HistoryPresenterProtocol? { get set }
}
