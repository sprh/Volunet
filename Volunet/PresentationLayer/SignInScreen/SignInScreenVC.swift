//
//  SignInScreenVC.swift
//  Volunet
//
//  Created by Софья Тимохина on 11.11.2021.
//

import UIKit

protocol ISignInScreenVC: UIViewController {

}

final class SignInScreenVC: UIViewController, ISignInScreenVC {
    private let interator: ISignInScreenInterator
    private let router: ISignInScreenRouter

    init(interator: ISignInScreenInterator,
         router: ISignInScreenRouter) {
        self.interator = interator
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

