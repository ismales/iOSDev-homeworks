//
//  LoginViewController.swift
//  Navigation
//
//  Created by Сманчос on 14.02.2023.
//

import UIKit

final class LoginViewController: UIViewController {

    private let profileVC = ProfileViewController()
    private let loginView = LoginView()
    private let notification = NotificationCenter.default

    private func setupLoginButton() {
        loginView.loginButton.addTarget(self, action: #selector(tapLoginAction), for: .touchUpInside)
    }


    // MARK: - lifecicle
    override func loadView() {
        view = loginView

        setupLoginButton()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        notification.addObserver(self, selector: #selector(keybordWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        notification.addObserver(self, selector: #selector(keybordWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        notification.removeObserver(UIResponder.keyboardWillShowNotification)
        notification.removeObserver(UIResponder.keyboardWillHideNotification)
    }

    // MARK: - @objc
    @objc private func keybordWillShow(notification: NSNotification) {
        if let keybordSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            loginView.scrollView.contentInset.bottom = keybordSize.height
            loginView.scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keybordSize.height, right: 0)
        }
    }

    @objc private func keybordWillHide() {
        loginView.scrollView.contentInset = .zero
        loginView.scrollView.verticalScrollIndicatorInsets = .zero
    }

    @objc private func tapLoginAction() {
        let profileVC = ProfileViewController()
        navigationController?.pushViewController(profileVC, animated: false)
    }
}
