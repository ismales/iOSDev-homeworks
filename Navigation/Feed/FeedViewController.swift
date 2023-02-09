//
//  FeedViewController.swift
//  Navigation
//
//  Created by Сманчос on 01.02.2023.
//

import UIKit

final class FeedViewController: UIViewController {

    private lazy var postButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: getStatusBarHeight(), width: UIScreen.main.bounds.width, height: 400))
        button.setTitle("Контент", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.blue, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        title = "Лента"
        setupPostButton()
    }

    private func setupPostButton() {
        view.addSubview(postButton)
        postButton.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
    }

    @objc private func tapAction() {
        let postVC = PostViewController(textForLabel: post)
        navigationController?.pushViewController(postVC, animated: true)
    }
}

let post = Post(title: "*загаловок*")
