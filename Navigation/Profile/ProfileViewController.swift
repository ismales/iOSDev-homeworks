//
//  ViewController.swift
//  Navigation
//
//  Created by Сманчос on 01.02.2023.
//

import UIKit

final class ProfileViewController: UIViewController {

    private let profileHeaderView = ProfileHeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        title = "Профиль"
        view.addSubview(profileHeaderView)
    }

    override func viewWillLayoutSubviews() {
        profileHeaderView.frame = CGRect(x: 0, y: getStatusBarHeight(), width: self.view.frame.size.width, height: self.view.frame.size.height / 2)
    }
}

