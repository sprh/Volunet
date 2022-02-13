//
//  SpecialHealthFeatureView.swift
//  Volunet
//
//  Created by Софья Тимохина on 03.02.2022.
//

import UIKit

class SpecialHealthFeatureView: UIView {
    var onUpdate: ((String) -> Void)?

    lazy var textView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .white
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()

    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    func setup(name: String?, onUpdate: @escaping (String) -> Void, trailingIcon: UIImage) {
        layer.cornerRadius = 20
        self.onUpdate = onUpdate
        textView.text = name
        textView.backgroundColor = backgroundColor
        textView.font = .preferredFont(forTextStyle: .body)
        imageView.image = trailingIcon
        addSubview(textView)
        addSubview(imageView)
        backgroundColor = .whiteTeal

        NSLayoutConstraint.activate([
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            imageView.topAnchor.constraint(equalTo: textView.topAnchor, constant: 10),
            imageView.bottomAnchor.constraint(equalTo: textView.bottomAnchor, constant: -10),
            imageView.heightAnchor.constraint(equalToConstant: 30),
            imageView.widthAnchor.constraint(equalToConstant: 30),

            textView.topAnchor.constraint(equalTo: topAnchor),
            textView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            textView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -16),
            textView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
