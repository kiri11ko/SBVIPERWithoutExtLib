//
//  MainTabBarViewController.swift
//  VIPERSBCoreData
//
//  Created Кирилл Лукьянов on 17.11.2019.
//  Copyright © 2019 Кирилл Лукьянов. All rights reserved.


import UIKit

class MainTabBarViewController: UITabBarController, MainTabBarViewProtocol {

    var presenter: MainTabBarPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        let translate = UIViewController.initialModule(module: GeneralRoute.translate)
        translate.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 0)

        let history = UIViewController.initialModule(module: GeneralRoute.history)
        history.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 1)

        let sourceLanguage = UIViewController.initialModule(module: GeneralRoute.sourceLanguage)
        sourceLanguage.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 2)

        let views: [UIViewController] = [translate, history,
                                         sourceLanguage].map { UINavigationController(rootViewController: $0)}
        viewControllers = views
    }

}
