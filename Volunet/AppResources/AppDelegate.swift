//
//  AppDelegate.swift
//  Volunet
//
//  Created by Софья Тимохина on 06.11.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let navigationController = UINavigationController()
        window = UIWindow()
        window?.rootViewController = navigationController
        navigationController.pushViewController(StartScreenGraph().viewController, animated: false)
        window?.makeKeyAndVisible()
        return true
    }
}

