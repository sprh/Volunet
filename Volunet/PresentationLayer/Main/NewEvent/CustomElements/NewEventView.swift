//
//  NewEventView.swift
//  Volunet
//
//  Created by Софья Тимохина on 19.04.2022.
//

import UIKit

final class NewEventView: UIStackView {
    lazy var eventNameLabel: UILabel = {
        let label = UILabel()
        label.text = .getLocalizedString(for: .eventName)
        label.font = .preferredFont(forTextStyle: .title3)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var eventName: UITextView = {
        let textField = UITextView()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .background
        textField.textColor = .text
        textField.layer.cornerRadius = 16
        textField.becomeFirstResponder()
        return textField
    }()

    lazy var eventDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = .getLocalizedString(for: .eventDescription)
        label.font = .preferredFont(forTextStyle: .title3)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var eventDescription: UITextView = {
        let textField = UITextView()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .background
        textField.textColor = .text
        textField.layer.cornerRadius = 16
        textField.becomeFirstResponder()
        return textField
    }()

    lazy var eventDatesLabel: UILabel = {
        let label = UILabel()
        label.text = .getLocalizedString(for: .eventDates)
        label.font = .preferredFont(forTextStyle: .title3)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var fromDate: UIDatePicker = {
        let datePicker = UIDatePicker()
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        }
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.minimumDate = .tomorrow
        return datePicker
    }()

    lazy var toDate: UIDatePicker = {
        let datePicker = UIDatePicker()
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        }
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.minimumDate = .tomorrow
        return datePicker
    }()

    lazy var eventLocationLabel: UILabel = {
        let label = UILabel()
        label.text = .getLocalizedString(for: .eventLocation)
        label.font = .preferredFont(forTextStyle: .title3)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var location: UITextView = {
        let textField = UITextView()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .background
        textField.textColor = .text
        textField.layer.cornerRadius = 16
        textField.becomeFirstResponder()
        return textField
    }()

    lazy var addEventButton: MainButton = {
        let viewModel = MainButton.ViewModel(font: .preferredFont(forTextStyle: .title3),
                                             title: .getLocalizedString(for: .addEvent),
                                             backgroundColor: .lightGreen,
                                             textColor: .darkText)
        let button = MainButton(viewModel: viewModel)
        button.isEnabled = false
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    func setup() {
        addSubview(eventNameLabel)
        addSubview(eventName)
        addSubview(eventDescriptionLabel)
        addSubview(eventDescription)
        addSubview(eventDatesLabel)
        addSubview(fromDate)
        addSubview(toDate)
        addSubview(eventLocationLabel)
        addSubview(location)
        addSubview(addEventButton)

        NSLayoutConstraint.activate([
            eventNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            eventNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            eventNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            eventName.topAnchor.constraint(equalTo: eventNameLabel.bottomAnchor, constant: 8),
            eventName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            eventName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            eventName.heightAnchor.constraint(equalToConstant: 55),

            eventDescriptionLabel.topAnchor.constraint(equalTo: eventName.bottomAnchor, constant: 16),
            eventDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            eventDescriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            eventDescription.topAnchor.constraint(equalTo: eventDescriptionLabel.bottomAnchor, constant: 8),
            eventDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            eventDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            eventDescription.heightAnchor.constraint(equalToConstant: 155),

            eventDatesLabel.topAnchor.constraint(equalTo: eventDescription.bottomAnchor, constant: 16),
            eventDatesLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            eventDatesLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            fromDate.topAnchor.constraint(equalTo: eventDatesLabel.bottomAnchor, constant: 16),
            fromDate.centerXAnchor.constraint(equalTo: centerXAnchor),
            fromDate.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            fromDate.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            toDate.topAnchor.constraint(equalTo: fromDate.bottomAnchor, constant: 16),
            toDate.centerXAnchor.constraint(equalTo: centerXAnchor),
            toDate.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            toDate.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            eventLocationLabel.topAnchor.constraint(equalTo: toDate.bottomAnchor, constant: 16),
            eventLocationLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            eventLocationLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            location.topAnchor.constraint(equalTo: eventLocationLabel.bottomAnchor, constant: 8),
            location.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            location.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            location.heightAnchor.constraint(equalToConstant: 55),

            addEventButton.topAnchor.constraint(equalTo: location.bottomAnchor, constant: 20),
            addEventButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            addEventButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            addEventButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            addEventButton.heightAnchor.constraint(equalToConstant: 55),
        ])
    }
}
