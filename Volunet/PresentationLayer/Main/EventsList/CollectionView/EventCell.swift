//
//  EventCell.swift
//  Volunet
//
//  Created by Софья Тимохина on 12.11.2021.
//

import Foundation
import UIKit

final class EventCell: UITableViewCell {
    private var isHeightCalculated: Bool = false
    lazy var calendarDate: UIView = {
        let viewModel = CalendarDate.ViewModel(topBorderColor: .red, // TODO: add custom
                                               backgroundColor: .background,
                                               dateTextColor: .text,
                                               dateFont: .preferredFont(forTextStyle: .caption1))
        let view = CalendarDate(frame: .zero,
                                viewModel: viewModel,
                                date: "5/20")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .body)
        label.textColor = .text
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()

    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .body)
        label.textColor = .text
        label.numberOfLines = 7
        return label
    }()

    lazy var ownerAvatar: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0,
                                                  y: 0,
                                                  width: 40,
                                                  height: 40))
        imageView.image = .volunteerOrganizationPlaceholder
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.makeRounded()
        imageView.contentMode = .scaleToFill
        return imageView
    }()

    lazy var ownerName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .caption1)
        label.textColor = .gray // TODO: add custom
        return label
    }()

    func setup() {
        backgroundColor = .whiteTeal
        title.text = "Мы едем в приют!"
        descriptionLabel.text = "Ты сможешь поделиться своей любовью и заботой с собаками из приюта ‘В добрые руки’. Если хочешь, захвати с собой немного корма, всех ждем :)"
        ownerName.text = "Мосволонтер"
        contentView.addSubview(calendarDate)
        contentView.addSubview(title)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(ownerName)
        contentView.addSubview(ownerAvatar)

        NSLayoutConstraint.activate([
            calendarDate.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14),
            calendarDate.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            calendarDate.trailingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 70),
            calendarDate.bottomAnchor.constraint(equalTo: contentView.topAnchor, constant: 72),

            title.centerYAnchor.constraint(equalTo: calendarDate.centerYAnchor),
            title.leadingAnchor.constraint(equalTo: calendarDate.trailingAnchor, constant: 12),

            descriptionLabel.topAnchor.constraint(equalTo: calendarDate.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),

            ownerAvatar.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
            ownerAvatar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            ownerAvatar.heightAnchor.constraint(equalToConstant: 41),
            ownerAvatar.widthAnchor.constraint(equalToConstant: 41),

            ownerName.leadingAnchor.constraint(equalTo: ownerAvatar.trailingAnchor, constant: 12),
            ownerName.bottomAnchor.constraint(equalTo: ownerAvatar.bottomAnchor, constant: -2),
            contentView.bottomAnchor.constraint(equalTo: ownerAvatar.bottomAnchor, constant: 12)
        ])
    }
}
