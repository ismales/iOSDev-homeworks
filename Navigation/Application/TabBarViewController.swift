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

    @objc private func buttonTap() {
        viewControllers = [feedVC, profileVC]
    }
}
