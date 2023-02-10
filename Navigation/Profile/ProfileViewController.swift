//
//  ViewController.swift
//  Navigation
//
//  Created by Сманчос on 01.02.2023.
//

import UIKit

final class ProfileViewController: UIViewController {

    private var profileHeaderView = ProfileHeaderView()

    private var button: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("(Временая кнопка)", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        $0.setTitleColor(.white, for: .normal)

        $0.backgroundColor = .blue
        $0.layer.cornerRadius = 4
        $0.layer.shadowOffset = CGSize(width: 4, height: 4)
        $0.layer.shadowOpacity = 0.7
        $0.layer.shadowColor = UIColor.black.cgColor
        return $0
    }(UIButton())

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        title = "Профиль"
        setupViews()
    }

    private func setupViews() {
        view.addSubview(profileHeaderView)
        view.addSubview(button)

        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),

            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            button.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}

