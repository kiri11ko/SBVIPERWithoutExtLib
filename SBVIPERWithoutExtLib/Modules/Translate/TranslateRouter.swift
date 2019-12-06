//
//  TranslateRouter.swift
//  VIPERSBCoreData
//
//  Created Кирилл Лукьянов on 17.11.2019.
//  Copyright © 2019 Кирилл Лукьянов. All rights reserved.

import UIKit

class TranslateRouter: TranslateWireframeProtocol {

    weak var viewController: UIViewController?

    static func createModule() -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = TranslateViewController(nibName: nil, bundle: nil)
        let interactor = TranslateInteractor()
        let router = TranslateRouter()
        let presenter = TranslatePresenter(interface: view, interactor: interactor, router: router)
        let coreData = CoreDataService()
        let network = NetworkService()
        view.presenter = presenter
        interactor.presenter = presenter
        interactor.coredata = coreData
        interactor.network = network
        router.viewController = view

        return view
    }

    func showLanguageModule() {
        viewController?.navigate(type: .select, module: GeneralRoute.sourceLanguage)
    }
    func showAlert(title: AlertsTitle, message: String) {
        viewController?.showAlert(title: .error, message: message)
    }
}
