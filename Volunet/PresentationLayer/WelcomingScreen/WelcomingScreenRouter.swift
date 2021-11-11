//
//  WelcomingScreenRouter.swift
//  Volunet
//
//  Created by Софья Тимохина on 06.11.2021.
//

import UIKit

protocol IWelcomingScreenRouter: AnyObject {
    var viewController: UIViewController? { get set }
}

final class WelcomingScreenRouter: IWelcomingScreenRouter {
    weak var viewController: UIViewController?
}
