//
//  TabBarViewController.swift
//  Navigation
//
//  Created by Сманчос on 01.02.2023.
//

import UIKit

final class TabBarViewController: UITabBarController {

    private let feedVC = FeedViewController()
    private let profileVC = ProfileViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupConrollers()
    }

    private func setupConrollers() {
        let feedNavigationController = UINavigationController(rootViewController: feedVC)
        feedVC.tabBarItem.title = "Лента"
        feedVC.tabBarItem.image = UIImage(systemName: "newspaper")

        let profileNavigationController = UINavigationController(rootViewController: profileVC)
        profileVC.tabBarItem.title = "Профиль"
        profileVC.tabBarItem.image = UIImage(systemName: "person")

        viewControllers = [feedNavigationController, profileNavigationController]
    }
}

