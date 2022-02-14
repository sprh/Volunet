//
//  AvardCell.swift
//  Volunet
//
//  Created by Софья Тимохина on 14.02.2022.
//

import UIKit

class AvardCell: UITableViewCell {
    lazy var background: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        view.backgroundColor = .darkTeal
        return view
    }()

    lazy var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .title3)
        label.textColor = .whiteTeal
        label.numberOfLines = 1
        return label
    }()

    lazy var avardImage: UIImageView = {
        let imageView = RoundedImageView(frame: CGRect(x: 0,
                                                       y: 0,
                                                       width: 80,
                                                       height: 80),
                                         image: nil,
                                         borderWidth: 0)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    func setup(avard: Avard) {
        avardImage.image = avard.image
        title.text = avard.title
        backgroundColor = .clear

        contentView.addSubview(background)
        contentView.addSubview(avardImage)
        background.addSubview(title)

        NSLayoutConstraint.activate([
            avardImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            avardImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            avardImage.heightAnchor.constraint(equalToConstant: 80),
            avardImage.widthAnchor.constraint(equalToConstant: 80),

            background.leadingAnchor.constraint(equalTo: avardImage.leadingAnchor, constant: 16),
            background.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            background.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),

            title.topAnchor.constraint(equalTo: background.topAnchor, constant: 16),
            title.bottomAnchor.constraint(equalTo: background.bottomAnchor, constant: -16),
            title.centerYAnchor.constraint(equalTo: background.centerYAnchor),
            title.centerXAnchor.constraint(equalTo: background.centerXAnchor),
        ])
    }
}
