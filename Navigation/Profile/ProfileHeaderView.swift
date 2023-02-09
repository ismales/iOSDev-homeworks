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
        let image = UIImageView(frame: CGRect(x: 16, y: 16, width: 110, height: 110))
        image.image = UIImage(named: "profileImage.png")
        image.layer.cornerRadius = 55
        image.layer.borderWidth = 4
        image.layer.borderColor = UIColor.white.cgColor
        image.clipsToBounds = true
        return image
    }()

    private var profileUserName: UILabel = {
        let name = UILabel(frame: CGRect(x: 150, y: 27, width: 150, height: 18))
        name.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        name.textColor = .black
        name.text = "Creator"
        return name
    }()

    private var profileUserStatus: UILabel = {
        let status = UILabel(frame: CGRect(x: 150, y: 94, width: 200, height: 14))
        status.font = UIFont.systemFont(ofSize: 14)
        status.text = "4udo, gde ti..."
        status.textColor = .gray
        return status
    }()

    private lazy var profileNewStatusField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 150, y: 124, width: UIScreen.main.bounds.width - 166, height: 50))
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
        let button = UIButton(frame: CGRect(x: 16, y: 190, width: UIScreen.main.bounds.width - 32, height: 50))
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
        addSubview(profileImage)
        addSubview(profileUserName)
        addSubview(profileUserStatus)
        addSubview(profileNewStatusField)
        addSubview(profileStatusChangeButton)
        pressButton()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func pressButton() {
        profileStatusChangeButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }

    @objc private func statusTextChanged(_ textField: UITextField) {
        statusText = profileNewStatusField.text!
    }

    @objc private func buttonPressed() {
        profileUserStatus.text = statusText
        profileNewStatusField.text = nil
    }
}
