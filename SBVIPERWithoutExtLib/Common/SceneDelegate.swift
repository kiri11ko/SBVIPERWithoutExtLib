//
//  SceneDelegate.swift
//  SBVIPERWithoutExtLib
//
//  Created by Кирилл Лукьянов on 05.12.2019.
//  Copyright © 2019 Кирилл Лукьянов. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {

        guard (scene as? UIWindowScene) != nil else { return }
        self.window?.rootViewController? = UIViewController.initialModule(module: GeneralRoute.main)
        self.window?.rootViewController?.navigate(type: .root, module: GeneralRoute.main)
    }

    func sceneDidDisconnect(_ scene: UIScene) {

    }

    func sceneDidBecomeActive(_ scene: UIScene) {

    }

    func sceneWillResignActive(_ scene: UIScene) {

    }

    func sceneWillEnterForeground(_ scene: UIScene) {

    }

    func sceneDidEnterBackground(_ scene: UIScene) {

    }

}
