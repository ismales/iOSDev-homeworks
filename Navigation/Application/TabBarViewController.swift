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
    private lazy var loginVC: LoginViewController = {
        let loginVC = LoginViewController()
        loginVC.delegate = self
        return loginVC
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupConrollers()
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

    func changeVC() {
        viewControllers = [feedVC, profileVC]
    }
}

extension TabBarViewController: LoginViewControllerDelegate, UITabBarControllerDelegate {
    func accessIsAllowed(_ isDataCorrect: Bool) {
        if isDataCorrect {
            changeVC()
        }
    }
}
