//
//  FeedViewController.swift
//  Navigation
//
//  Created by Сманчос on 01.02.2023.
//

import UIKit

final class FeedViewController: UIViewController {

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()

    private lazy var postButton1: UIButton = {
        let button = UIButton()
        button.setTitle("Контент", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        button.setTitleColor(.blue, for: .normal)
        return button
    }()

    private lazy var postButton2: UIButton = {
        let button = UIButton()
        button.setTitle("Контент", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        button.setTitleColor(.blue, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        title = "Лента"
        setupPostButton()
        layout()
    }

    private func layout() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(postButton1)
        stackView.addArrangedSubview(postButton2)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }

    private func setupPostButton() {
        postButton1.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        postButton2.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
    }

    @objc private func tapAction() {
        let postVC = PostViewController(textForLabel: post)
        navigationController?.pushViewController(postVC, animated: true)
    }
}

let post = Post(title: "*загаловок*")
