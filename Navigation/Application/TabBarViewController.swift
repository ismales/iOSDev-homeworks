//
//  TabBarViewController.swift
//  Navigation
//
//  Created by Сманчос on 01.02.2023.
//

import UIKit

final class TabBarViewController: UITabBarController {

    private let feedVC = UINavigationController(rootViewController: FeedViewController())
    private let profileVC = UINavigationController(rootViewController: LoginViewController())
    private let loginVC = LoginViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupConrollers()
    }

    private func setupConrollers() {
        tabBar.backgroundColor = .white

        profileVC.navigationBar.isHidden = true

        feedVC.tabBarItem.title = "Лента"
        feedVC.tabBarItem.image = UIImage(systemName: "newspaper")

        profileVC.tabBarItem.title = "Профиль"
        profileVC.tabBarItem.image = UIImage(systemName: "person")

        viewControllers = [feedVC, profileVC]
    }

    private func changeVC() {
    }
}
