//
//  MainTabBarPresenter.swift
//  VIPERSBCoreData
//
//  Created Кирилл Лукьянов on 17.11.2019.
//  Copyright © 2019 Кирилл Лукьянов. All rights reserved.


import UIKit

class MainTabBarPresenter: MainTabBarPresenterProtocol, MainTabBarInteractorOutputProtocol {

    weak private var view: MainTabBarViewProtocol?
    var interactor: MainTabBarInteractorInputProtocol?
    private let router: MainTabBarWireframeProtocol

    init(interface: MainTabBarViewProtocol,
         interactor: MainTabBarInteractorInputProtocol?,
         router: MainTabBarWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

}
