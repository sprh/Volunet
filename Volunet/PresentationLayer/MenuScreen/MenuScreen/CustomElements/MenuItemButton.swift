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

    lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .whiteTeal
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        return view
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
        addSubview(contentView)
        contentView.addSubview(labelTitle)
        contentView.addSubview(trailingImage)

        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),

            labelTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            labelTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            labelTitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),


            trailingImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            trailingImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            trailingImage.heightAnchor.constraint(equalToConstant: 20),
            trailingImage.widthAnchor.constraint(equalToConstant: 20),
        ])
    }
}
