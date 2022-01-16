//
//  RoundedAvatar.swift
//  Volunet
//
//  Created by Софья Тимохина on 16.01.2022.
//

import UIKit

final class AvatarView: UIImageView {
    init(frame: CGRect, image: UIImage) {
        super.init(frame: frame)
        self.image = image
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        makeRounded()
        contentMode = .scaleToFill
        layer.borderWidth = 7
        layer.borderColor = UIColor.white.cgColor
    }
}
