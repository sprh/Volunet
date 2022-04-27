//
//  AppInfoVC.swift
//  Volunet
//
//  Created by Софья Тимохина on 27.04.2022.
//

import Foundation
import UIKit

class AppInfoVC: UIViewController {
    lazy var appInfo: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .title3)
        let nsObject = Bundle.main.infoDictionary?["CFBundleShortVersionString"]
        let version = nsObject as? String ?? "1.0"
        label.text = "Версия приложения \(version)\n\nПриложение «VOLUNET» ориентировано на упрощение и улучшения качества и условий осуществления волонтерской деятельности, а также поиска волонтеров на мероприятия. Оно предназначено для решения проблем волонтерского движения, к которым относятся неудобные способы коммуникации между волонтерами и организациями, отсутствие каналов для информирования, обратной связи и единой базы для волонтеров, недостаточно развитая поощрительная система. Основная идея заключается в создании экосистемы, объединяющей в одном приложении волонтеров и волонтерские организации, для осуществления волонтерской деятельности в различных сферах жизни с максимально удобными условиями для всех сторон, участвующих в волонтерской деятельности."
        label.lineBreakMode = .byClipping
        return label
    }()

    lazy var backButton: UIBarButtonItem = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
        imageView.image = .chevronLeft.withTintColor(.whiteTeal)
        button.addSubview(imageView)
        button.addTarget(self, action: #selector(didTabBackButton), for: .touchUpInside)
        let leftBarButtonItem = UIBarButtonItem(customView: button)
        return leftBarButtonItem
    }()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(appInfo)
        navigationItem.leftBarButtonItem = backButton
        NSLayoutConstraint.activate([
            appInfo.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            appInfo.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            appInfo.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
        ])
        view.layoutIfNeeded()
        view.makeGradientBackground(with: [UIColor.lightTeal.cgColor,
                                           UIColor.darkTeal.cgColor,
                                           UIColor.darkTeal.cgColor,
                                           UIColor.darkTeal.cgColor])
    }

    @objc
    func didTabBackButton() {
        navigationController?.popViewController(animated: true)
    }
}
