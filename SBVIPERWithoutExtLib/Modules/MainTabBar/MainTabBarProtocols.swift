//
//  MainTabBarProtocols.swift
//  VIPERSBCoreData
//
//  Created Кирилл Лукьянов on 17.11.2019.
//  Copyright © 2019 Кирилл Лукьянов. All rights reserved.


import Foundation

// MARK: Wireframe -
protocol MainTabBarWireframeProtocol: class {

}
// MARK: Presenter -
protocol MainTabBarPresenterProtocol: class {

    var interactor: MainTabBarInteractorInputProtocol? { get set }
}

// MARK: Interactor -
protocol MainTabBarInteractorOutputProtocol: class {

    /* Interactor -> Presenter */
}

protocol MainTabBarInteractorInputProtocol: class {

    var presenter: MainTabBarInteractorOutputProtocol? { get set }

    /* Presenter -> Interactor */
}

// MARK: View -
protocol MainTabBarViewProtocol: class {

    var presenter: MainTabBarPresenterProtocol? { get set }

    /* Presenter -> ViewController */
}
