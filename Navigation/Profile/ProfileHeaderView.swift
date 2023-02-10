//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Сманчос on 08.02.2023.
//

import UIKit

class ProfileHeaderView: UIView {

    private var statusText = ""

    private var profileImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "profileImage.png")
        image.layer.cornerRadius = 55
        image.layer.borderWidth = 4
        image.layer.borderColor = UIColor.white.cgColor
        image.clipsToBounds = true
        return image
    }()

    private var profileUserName: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        name.textColor = .black
        name.text = "Creator"
        return name
    }()

    private var profileUserStatus: UILabel = {
        let status = UILabel()
        status.translatesAutoresizingMaskIntoConstraints = false
        status.font = UIFont.systemFont(ofSize: 14)
        status.text = "4udo, gde ti..."
        status.textColor = .gray
        return status
    }()

    private lazy var profileNewStatusField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.placeholder = "Введите текст"
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.layer.cornerRadius = 12
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        return textField
    }()

    private var profileStatusChangeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Установить статус", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)

        button.backgroundColor = .blue
        button.layer.cornerRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowOpacity = 0.7
        button.layer.shadowColor = UIColor.black.cgColor
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false

        pressButton()
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func pressButton() {
        profileStatusChangeButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }

    private func layout() {
        addSubview(profileImage)
        addSubview(profileUserName)
        addSubview(profileUserStatus)
        addSubview(profileNewStatusField)
        addSubview(profileStatusChangeButton)

        NSLayoutConstraint.activate([
            profileImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            profileImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            profileImage.heightAnchor.constraint(equalToConstant: 110),
            profileImage.widthAnchor.constraint(equalToConstant: 110),

            profileUserName.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            profileUserName.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 20),
            profileUserName.heightAnchor.constraint(equalToConstant: 18),
            profileUserName.widthAnchor.constraint(equalToConstant: profileUserName.intrinsicContentSize.width),

            profileUserStatus.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 80),
            profileUserStatus.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 20),
            profileUserStatus.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            profileNewStatusField.topAnchor.constraint(equalTo: profileUserStatus.topAnchor, constant: 20),
            profileNewStatusField.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 20),
            profileNewStatusField.heightAnchor.constraint(equalToConstant: 40),
            profileNewStatusField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            profileStatusChangeButton.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 30),
            profileStatusChangeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            profileStatusChangeButton.heightAnchor.constraint(equalToConstant: 50),
            profileStatusChangeButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 32)
        ])
    }

    @objc private func statusTextChanged(_ textField: UITextField) {
        statusText = profileNewStatusField.text!
    }

    @objc private func buttonPressed() {
        profileUserStatus.text = statusText
        profileNewStatusField.text = nil
    }
}
