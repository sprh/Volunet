//
//  TabBarControllerGraph.swift
//  Volunet
//
//  Created by Софья Тимохина on 14.02.2022.
//

import UIKit

class TabBarControllerGraph {
    let controller: UITabBarController

    init() {
        controller = TabBarController(controllers: [TabBarControllerGraph.getMainPage(),
                                                    TabBarControllerGraph.getProfilePage()])
    }

    private static func getProfilePage() -> UIViewController {
        let viewController = MenuScreenGraph().viewController
        viewController.tabBarItem.image = .menuItem
        return viewController
    }

    private static func getMainPage() -> UIViewController {
        let viewController = EventsListScreenGraph().viewController
        viewController.tabBarItem.image = .mainTabBarItem
        return viewController
    }
}
