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
    }

    /// An objc methon that animate a button.
    ///
    /// Can be added in the init:
    /// ```
    /// addTarget(self, action: #selector(onPress), for: .touchUpInside)
    /// ```
    @objc func onPress() {
        UIView.animate(withDuration: 0.1, animations: { [weak self] in
            self?.transform = CGAffineTransform.init(scaleX: 0.9, y: 0.9)
            self?.alpha = 0.8
        }, completion: {[weak self] finished in
            if finished {
                self?.transform = CGAffineTransform.init(scaleX: 1, y: 1)
                self?.alpha = 1
            }
        })
    }
}

