//
//  CloseButton.swift
//  Volunet
//
//  Created by Софья Тимохина on 16.01.2022.
//

import UIKit

final class CloseButton: UIButton {
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        backgroundColor = .darkTeal
        setImage(.close, for: .normal)
        layer.cornerRadius = frame.width / 2
        addTarget(self, action: #selector(onPress), for: .touchUpInside)
    }
}
