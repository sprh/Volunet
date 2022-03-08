//
//  MainButton.swift
//  Volunet
//
//  Created by Софья Тимохина on 11.11.2021.
//

import UIKit

final class MainButton: UIButton {
    struct ViewModel {
        let font: UIFont
        let title: String?
        // Background color if isEnabled = true
        let enabledBackgroundColor: UIColor
        // Background color if isEnabled = false
        let disabledBackgroundColor: UIColor
        // Text color if isEnabled = true
        let enabledTextColor: UIColor
        // Text color if isEnabled = false
        let disabledTextColor: UIColor
        // Button corner radius
        let cornerRadius: CGFloat

        init(font: UIFont,
             title: String?,
             enabledBackgroundColor: UIColor,
             disabledBackground: UIColor,
             enabledTextColor: UIColor,
             disabledTextColor: UIColor,
             cornerRadius: CGFloat = 27) {
            self.font = font
            self.title = title
            self.enabledBackgroundColor = enabledBackgroundColor
            self.disabledBackgroundColor = disabledBackground
            self.enabledTextColor = enabledTextColor
            self.disabledTextColor = disabledTextColor
            self.cornerRadius = cornerRadius
        }

        init(font: UIFont,
             title: String?,
             backgroundColor: UIColor,
             textColor: UIColor,
             cornerRadius: CGFloat = 27) {
            self.font = font
            self.title = title
            self.enabledBackgroundColor = backgroundColor
            self.disabledBackgroundColor = backgroundColor
            self.enabledTextColor = textColor
            self.disabledTextColor = textColor
            self.cornerRadius = cornerRadius
        }
    }

    private var enabledBackgroundColor: UIColor!
    private var disabledBackgroundColor: UIColor!
    private var enabledTextColor: UIColor!
    private var disabledTextColor: UIColor!
    private lazy var dotsAnimationView: DotsAnimationView = {
        let view = DotsAnimationView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    }()
    private var title: String!

    /// Override var isEnabled to change colors (background and text) to show user that it is not enabled.
    override var isEnabled: Bool {
        didSet {
            super.isEnabled = isEnabled
            if isEnabled {
                backgroundColor = enabledBackgroundColor
                setTitleColor(enabledTextColor, for: .normal)
            } else {
                backgroundColor = disabledBackgroundColor
                setTitleColor(disabledTextColor, for: .normal)
            }
        }
    }

    init(frame: CGRect = .zero, viewModel: ViewModel) {
        super.init(frame: frame)
        configurate(with: viewModel)
        addTarget(self, action: #selector(onPress), for: .touchUpInside)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    /// Confugurate the main button with parameters from the view model.
    private func configurate(with viewModel: ViewModel) {
        setTitle(viewModel.title, for: .normal)
        layer.cornerRadius = viewModel.cornerRadius
        titleLabel?.font = viewModel.font
        enabledTextColor = viewModel.enabledTextColor
        disabledTextColor = viewModel.disabledTextColor
        enabledBackgroundColor = viewModel.enabledBackgroundColor
        disabledBackgroundColor = viewModel.disabledBackgroundColor
        title = viewModel.title

        addSubview(dotsAnimationView)
        NSLayoutConstraint.activate([
            dotsAnimationView.topAnchor.constraint(equalTo: topAnchor),
            dotsAnimationView.bottomAnchor.constraint(equalTo: bottomAnchor),
            dotsAnimationView.leadingAnchor.constraint(equalTo: leadingAnchor),
            dotsAnimationView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }

    func startAnimation() {
        setTitle(nil, for: .normal)
        dotsAnimationView.isHidden = false
        dotsAnimationView.startAnimation()
    }

    func stopAnimation() {
        dotsAnimationView.stopAnimation()
        dotsAnimationView.isHidden = true
        setTitle(title, for: .normal)
    }
}

