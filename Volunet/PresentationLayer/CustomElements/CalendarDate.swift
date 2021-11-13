//
//  CalendarDate.swift
//  Volunet
//
//  Created by Софья Тимохина on 12.11.2021.
//

import Foundation
import UIKit

final class CalendarDate: UIView {
    struct ViewModel {
        let topBorderColor: UIColor
        let backgroundColor: UIColor
        let dateTextColor: UIColor
        let dateFont: UIFont
    }

    lazy var topBorder: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    init(frame: CGRect, viewModel: ViewModel, date: String) {
        super.init(frame: frame)
        configurate(viewModel: viewModel, date: date)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configurate(viewModel: ViewModel, date: String) {
        backgroundColor = viewModel.backgroundColor
        topBorder.backgroundColor = viewModel.topBorderColor
        dateLabel.textColor = viewModel.dateTextColor
        dateLabel.text = date
        addSubview(topBorder)
        addSubview(dateLabel)

        NSLayoutConstraint.activate([
            topBorder.leadingAnchor.constraint(equalTo: leadingAnchor),
            topBorder.topAnchor.constraint(equalTo: topAnchor),
            topBorder.trailingAnchor.constraint(equalTo: trailingAnchor),
            topBorder.heightAnchor.constraint(equalToConstant: 6),

            dateLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            dateLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
