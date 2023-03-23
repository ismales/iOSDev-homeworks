//
//  TabBarViewController.swift
//  Navigation
//
//  Created by Сманчос on 01.02.2023.
//

import UIKit

final class TabBarViewController: UITabBarController {

    private let feedVC = UINavigationController(rootViewController: FeedViewController())
    private let profileVC = UINavigationController(rootViewController: ProfileViewController())
    private let loginVC = LoginViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupConrollers()
        changeVC()
    }

    private func setupConrollers() {
        tabBar.backgroundColor = .white

        feedVC.tabBarItem.title = "Лента"
        feedVC.tabBarItem.image = UIImage(systemName: "newspaper")

        profileVC.tabBarItem.title = "Профиль"
        profileVC.tabBarItem.image = UIImage(systemName: "person")

        loginVC.tabBarItem.title = "Профиль"
        loginVC.tabBarItem.image = UIImage(systemName: "person")

        viewControllers = [feedVC, loginVC]
    }

    private func changeVC() {
        loginVC.loginButton.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
    }

    private func validAlert() {
        let alert = UIAlertController(title: "Неправильный логин или пароль", message: nil, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Ок", style: .default) { _ in }
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }

    @objc private func buttonTap() {
        guard let text = loginVC.loginField.text, !text.isEmpty && text.count > 5 else { return loginVC.loginField.shakeField(field: loginVC.loginField) }

        guard let text = loginVC.passwordField.text, !text.isEmpty && text.count > 5 else { return loginVC.passwordField.shakeField(field: loginVC.passwordField) }

        guard loginVC.loginField.text! == "login123@mail.com" && loginVC.passwordField.text! == "login123" else { return validAlert() }
        viewControllers = [feedVC, profileVC]
    }
}
