//
//  RoundedImageView.swift
//  Volunet
//
//  Created by Софья Тимохина on 16.01.2022.
//

import UIKit

final class RoundedImageView: UIButton {
    private let layerColor: UIColor
    private let borderWidth: CGFloat

    init(frame: CGRect,
         image: UIImage?,
         layerColor: UIColor = .white,
         borderWidth: CGFloat = 7) {
        self.layerColor = layerColor
        self.borderWidth = borderWidth
        super.init(frame: frame)
        setImage(image, for: .normal)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        makeRounded()
        contentMode = .scaleToFill
        layer.borderWidth = borderWidth
        layer.borderColor = layerColor.cgColor
    }
}
