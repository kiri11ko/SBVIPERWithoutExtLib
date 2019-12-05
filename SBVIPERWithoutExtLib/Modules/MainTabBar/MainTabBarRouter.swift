//
//  MainTabBarRouter.swift
//  VIPERSBCoreData
//
//  Created Кирилл Лукьянов on 17.11.2019.
//  Copyright © 2019 Кирилл Лукьянов. All rights reserved.


import UIKit

class MainTabBarRouter: MainTabBarWireframeProtocol {

    weak var viewController: UIViewController?

    static func createModule() -> UITabBarController {
        // Change to get view from storyboard if not using progammatic UI
        let view = MainTabBarViewController(nibName: nil, bundle: nil)
        let interactor = MainTabBarInteractor()
        let router = MainTabBarRouter()
        let presenter = MainTabBarPresenter(interface: view, interactor: interactor, router: router)

        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view

        return view
    }

}
