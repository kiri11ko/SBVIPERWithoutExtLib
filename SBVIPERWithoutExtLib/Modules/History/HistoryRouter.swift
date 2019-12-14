//
//  HistoryRouter.swift
//  VIPERSBCoreData
//
//  Created Кирилл Лукьянов on 17.11.2019.
//  Copyright © 2019 Кирилл Лукьянов. All rights reserved.

import UIKit

class HistoryRouter: HistoryWireframeProtocol {

    weak var viewController: UIViewController?

    static func createModule() -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = HistoryViewController(nibName: nil, bundle: nil)
        let interactor = HistoryInteractor()
        let router = HistoryRouter()
        let presenter = HistoryPresenter(interface: view, interactor: interactor, router: router)
        let coreData = CoreDataService()
        interactor.coredata = coreData
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
}
