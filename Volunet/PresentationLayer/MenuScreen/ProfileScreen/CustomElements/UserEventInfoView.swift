//
//  UserEventInfoView.swift
//  Volunet
//
//  Created by Софья Тимохина on 13.02.2022.
//

import UIKit

class UserEventInfoView: UIButton {
    var event: UserEvent?

    lazy var date: UILabel = {
        let label = UILabel()
        label.text = event?.event.startDate
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .whiteTeal
        label.font = .preferredFont(forTextStyle: .body)
        return label
    }()

    lazy var title: UILabel = {
        let label = UILabel()
        label.text = event?.event.title
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .whiteTeal
        label.font = .preferredFont(forTextStyle: .body)
        return label
    }()

    lazy var mark: UILabel = {
        let label = UILabel()
        if let mark = event?.mark {
            label.text = " \(mark)"
        } else {
            mark.isHidden = true
        }
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 20
        label.backgroundColor = .teal
        label.textColor = .whiteTeal
        label.font = .preferredFont(forTextStyle: .body)
        return label
    }()

    func setup(event: UserEvent) {
        self.event = event
        layer.cornerRadius = 20
        addTarget(self, action: #selector(onPress), for: .touchUpInside)
        backgroundColor = .darkTeal

        addSubview(date)
        addSubview(title)
        addSubview(mark)
        NSLayoutConstraint.activate([
            date.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            date.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            date.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),

            title.leadingAnchor.constraint(equalTo: date.trailingAnchor, constant: 5),
            title.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            title.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),

            mark.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            mark.leadingAnchor.constraint(equalTo: title.trailingAnchor, constant: 10),
            mark.heightAnchor.constraint(equalToConstant: 40),
            mark.widthAnchor.constraint(equalToConstant: 40),
            mark.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
