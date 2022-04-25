//
//  CustomStyle.swift
//  MessengerKit_Example
//
//  Created by Stephen Radford on 14/06/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import MessengerKit

struct ChatViewStyle: MSGMessengerStyle {

    var outgoingLinkUnderlineStyle: NSNumber = 0

    var incomingLinkUnderlineStyle: NSNumber = 0

    var inputTextViewBackgroundColor: UIColor = UIColor.white

    var collectionView: MSGCollectionView.Type = ChatCollectionView.self
    
    var inputView: MSGInputView.Type = MSGImessageInputView.self
    
    var headerHeight: CGFloat = 0
    
    var footerHeight: CGFloat = 0
    
    var backgroundColor: UIColor = .whiteTeal
    
    var inputViewBackgroundColor: UIColor = .lightTeal
    
    var font: UIFont = .preferredFont(forTextStyle: .body)
    
    var inputFont: UIFont = .systemFont(ofSize: 14)
    
    var inputPlaceholder: String = "Не стесняйся просить что-то важное!"
    
    var inputTextColor: UIColor = .darkText
    
    var inputPlaceholderTextColor: UIColor = .lightGray
    
    var outgoingTextColor: UIColor = .white
    
    var outgoingLinkColor: UIColor = .white
    
    var incomingTextColor: UIColor = .white
    
    var incomingLinkColor: UIColor = .white
    
    func size(for message: MSGMessage, in collectionView: UICollectionView) -> CGSize {
        var size: CGSize!
        
        switch message.body {
        case .text(let body):
            
            let bubble = MessageBubble()
            bubble.text = body
            bubble.font = font
            let bubbleSize = bubble.calculatedSize(in: CGSize(width: collectionView.bounds.width, height: .infinity))
            size = CGSize(width: collectionView.bounds.width, height: bubbleSize.height)
            
            break
            
            
        case .emoji:
            
            size = CGSize(width: collectionView.bounds.width, height: 60)
            
            break
            
        default:
            
            size = CGSize(width: collectionView.bounds.width, height: 175)
            
            break
        }
        
        return size
    }
    
    // MARK - Custom Properties
    
    var incomingBorderColor: UIColor = .clear
    
    var outgoingBorderColor: UIColor = .clear
    
}
