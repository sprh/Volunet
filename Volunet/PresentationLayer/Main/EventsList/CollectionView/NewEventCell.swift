//
//  NewEventCell.swift
//  Volunet
//
//  Created by Софья Тимохина on 19.04.2022.
//

import Foundation
import UIKit

class NewEventCell: UITableViewCell {
    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    func setup() {
        backgroundColor = .whiteTeal
        selectionStyle = .none
        label.font = .preferredFont(forTextStyle: .title3)
        label.text = .getLocalizedString(for: .addEvent)
        contentView.addSubview(label)

        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
        ])
    }
}
