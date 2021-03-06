//
//  UIViewController+Utils.swift
//  Volunet
//
//  Created by Софья Тимохина on 11.11.2021.
//

import UIKit

extension UIViewController {
    // https://stackoverflow.com/questions/68387187/how-to-use-uiwindowscene-windows-on-ios-15/68397379#68397379
    private static var keyWindow: UIWindow? {
        return UIApplication.shared.connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .first(where: { $0 is UIWindowScene })
            .flatMap({ $0 as? UIWindowScene })?.windows
            .first(where: \.isKeyWindow)
    }

    static var safeAreaHeight: CGFloat {
        topSafeAreaHeight + bottomSafeAreaHeight
    }

    static var topSafeAreaHeight: CGFloat {
        keyWindow?.safeAreaInsets.top ?? 0
    }

    static var bottomSafeAreaHeight: CGFloat {
        keyWindow?.safeAreaInsets.top ?? 0
    }

    /// This method helps to hide keyboard.
    /// When keyboard is shown and user taps on the screen keyboard will hide if it was not a text field/view etc.
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    /// Chnage a scroll view content inset and scroll indicator inset when keyboard is shown.
    /// This method is suitable not only for a scroll view but also for a table view.
    func keyboardWillShow(_ scrollView: UIScrollView) {
        _ = NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification,
                                                   object: nil, queue: nil, using: { notification -> Void in
                                                    guard let userInfo = notification.userInfo,
                                                          let keyboardSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as AnyObject).cgRectValue?.size
                                                    else {return}
                                                    let contentInsets = UIEdgeInsets(top: 0,
                                                                                     left: 0,
                                                                                     bottom: keyboardSize.height,
                                                                                     right: 0)
                                                    scrollView.contentInset = contentInsets
                                                    scrollView.scrollIndicatorInsets = contentInsets
                                                   })
    }

    /// Chnage a scroll view content inset and scroll indicator inset when keyboard is hidden.
    /// This method is suitable not only for a scroll view but also for a table view.
    func keyboardWillHide(_ scrollView: UIScrollView) {
        _ = NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification,
                                                   object: nil, queue: nil, using: { _ -> Void in
                                                    scrollView.contentInset = .zero
                                                    scrollView.scrollIndicatorInsets = .zero
                                                   })
    }

    func setNavigationControllerTransparent() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = .clear
    }
}
