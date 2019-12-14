//
//  SourceLanguageProtocols.swift
//  VIPERSBCoreData
//
//  Created Кирилл Лукьянов on 17.11.2019.
//  Copyright © 2019 Кирилл Лукьянов. All rights reserved.

import Foundation

// MARK: Wireframe -
protocol SourceLanguageWireframeProtocol: class {

}
// MARK: Presenter -
protocol SourceLanguagePresenterProtocol: class {
    var interactor: SourceLanguageInteractorProtocol? { get set }
    func getLanguageList() -> [String]
}

// MARK: Interactor -
protocol SourceLanguageInteractorProtocol: class {

  var presenter: SourceLanguagePresenterProtocol? { get set }
}

// MARK: View -
protocol SourceLanguageViewProtocol: class {

  var presenter: SourceLanguagePresenterProtocol? { get set }
}
