//
//  MenuItemButton.swift
//  Volunet
//
//  Created by Софья Тимохина on 13.03.2022.
//

import UIKit

class MenuItemButton: UIButton {
    private let title: String
    lazy var labelTitle: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .body)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkTeal
        label.text = title
        return label
    }()

    lazy var trailingImage: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.image = .chevronRight
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()


    init(frame: CGRect = .zero, title: String) {
        self.title = title
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        addTarget(self, action: #selector(onPress), for: .touchUpInside)
        backgroundColor = .whiteTeal
        layer.cornerRadius = 20
        addSubview(labelTitle)
        addSubview(trailingImage)

        NSLayoutConstraint.activate([

            labelTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            labelTitle.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            labelTitle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),


            trailingImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            trailingImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            trailingImage.heightAnchor.constraint(equalToConstant: 20),
            trailingImage.widthAnchor.constraint(equalToConstant: 20),
        ])
    }
}
