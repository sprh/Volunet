//
//  LoadingTableViewCell.swift
//  Volunet
//
//  Created by Софья Тимохина on 13.03.2022.
//

import UIKit

class LoadingTableViewCell: UITableViewCell {
    lazy var dotsAnimationView: DotsAnimationView = {
        let view = DotsAnimationView()
        view.startAnimation()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    func setup() {
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        contentView.addSubview(dotsAnimationView)

        NSLayoutConstraint.activate([
            dotsAnimationView.topAnchor.constraint(equalTo: contentView.topAnchor),
            dotsAnimationView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            dotsAnimationView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            dotsAnimationView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
}
