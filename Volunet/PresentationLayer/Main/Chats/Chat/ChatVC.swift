//
//  ChatVC.swift
//  Volunet
//
//  Created by Софья Тимохина on 25.04.2022.
//

import UIKit
import MessengerKit

class ChatVC: MSGMessengerViewController {

    var id = 100

    lazy var messages: [[MSGMessage]] = Mocks.messages

    lazy var backButton: UIBarButtonItem = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
        imageView.image = .chevronLeft.withTintColor(.lightTeal)
        button.addSubview(imageView)
        button.addTarget(self, action: #selector(didTabBackButton), for: .touchUpInside)
        let leftBarButtonItem = UIBarButtonItem(customView: button)
        return leftBarButtonItem
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Поездка в приют"
        navigationController?.navigationBar.barTintColor = .lightTeal
        navigationItem.leftBarButtonItem = backButton
        dataSource = self
    }

    override var style: MSGMessengerStyle {
        return ChatViewStyle()
    }

    override func inputViewPrimaryActionTriggered(inputView: MSGInputView) {
        id += 1

        let body: MSGMessageBody = .text(inputView.message)

        let message = MSGMessage(id: id, body: body, user: Mocks.sashaProfile, sentAt: Date())
        insert(message)
        Mocks.messages.append([message])
    }

    override func insert(_ message: MSGMessage) {

        collectionView.performBatchUpdates({
            if let lastSection = self.messages.last, let lastMessage = lastSection.last, lastMessage.user.displayName == message.user.displayName {
                self.messages[self.messages.count - 1].append(message)

                let sectionIndex = self.messages.count - 1
                let itemIndex = self.messages[sectionIndex].count - 1
                self.collectionView.insertItems(at: [IndexPath(item: itemIndex, section: sectionIndex)])

            } else {
                self.messages.append([message])
                let sectionIndex = self.messages.count - 1
                self.collectionView.insertSections([sectionIndex])
            }
        }, completion: { (_) in
            self.collectionView.scrollToBottom(animated: true)
            self.collectionView.layoutTypingLabelIfNeeded()
        })

    }

    override func insert(_ messages: [MSGMessage], callback: (() -> Void)? = nil) {

        collectionView.performBatchUpdates({
            for message in messages {
                if let lastSection = self.messages.last, let lastMessage = lastSection.last, lastMessage.user.displayName == message.user.displayName {
                    self.messages[self.messages.count - 1].append(message)

                    let sectionIndex = self.messages.count - 1
                    let itemIndex = self.messages[sectionIndex].count - 1
                    self.collectionView.insertItems(at: [IndexPath(item: itemIndex, section: sectionIndex)])

                } else {
                    self.messages.append([message])
                    let sectionIndex = self.messages.count - 1
                    self.collectionView.insertSections([sectionIndex])
                }
            }
        }, completion: { (_) in
            self.collectionView.scrollToBottom(animated: false)
            self.collectionView.layoutTypingLabelIfNeeded()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                callback?()
            }
        })

    }

    @objc
    private func didTabBackButton() {
        navigationController?.popViewController(animated: true)
    }
}


// MARK: - MSGDataSource

extension ChatVC: MSGDataSource {

    func numberOfSections() -> Int {
        return messages.count
    }

    func numberOfMessages(in section: Int) -> Int {
        return messages[section].count
    }

    func message(for indexPath: IndexPath) -> MSGMessage {
        return messages[indexPath.section][indexPath.item]
    }

    func footerTitle(for section: Int) -> String? {
        return "Just now"
    }

    func headerTitle(for section: Int) -> String? {
        return messages[section].first?.user.displayName
    }

}
