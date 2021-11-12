//
//  MainScreenVC.swift
//  Volunet
//
//  Created by Софья Тимохина on 12.11.2021.
//

import UIKit

protocol IMainScreenVC: UIViewController {

}

final class MainScreenVC: UIViewController, IMainScreenVC {
    private let interator: IMainScreenInterator
    private let router: IMainScreenRouter

    init(interator: IMainScreenInterator,
         router: IMainScreenRouter) {
        self.interator = interator
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

