//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Сманчос on 08.02.2023.
//

import UIKit

class ProfileHeaderView: UIView {

    // MARK: - Propertie's
    private var statusText = ""

    private var topConstraint = NSLayoutConstraint()
    private var leadingConstraint = NSLayoutConstraint()
    private var widthConstraint = NSLayoutConstraint()
    private var heightConstraint = NSLayoutConstraint()

    private let headerContentView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

     private let avatar: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "profileImage.png")
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 55
        image.layer.borderWidth = 4
        image.layer.borderColor = UIColor.white.cgColor
        image.clipsToBounds = true
        image.isUserInteractionEnabled = true
        return image
    }()

    private var userNameLabel: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        name.textColor = .black
        name.text = "Creator"
        return name
    }()

    private var userStatusLabel: UILabel = {
        let status = UILabel()
        status.translatesAutoresizingMaskIntoConstraints = false
        status.font = UIFont.systemFont(ofSize: 14)
        status.text = "4udo, gde ti..."
        status.textColor = .gray
        return status
    }()

    private lazy var newStatusField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.placeholder = "Введите текст"
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.layer.cornerRadius = 12
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.delegate = self
        textField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        return textField
    }()

    private var updateStatusButton: UIButton = {
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

    private let backgroindImageView: UIView = { // for animate
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        view.alpha = 0.0
        view.backgroundColor = .black
        return view
    }()

    private lazy var closeButton: UIButton = { //for animate
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .white
        button.alpha = 0
        button.addTarget(self, action: #selector(closeButtonTap), for: .touchUpInside)
        return button
    }()

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false

        pressButton()
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Method's
    private func pressButton() {
        updateStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }

    func imageTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapImage))
        self.avatar.addGestureRecognizer(tapGesture)
    }

    // MARK: - Layot
    private func layout() {
        addSubview(headerContentView)
        [avatar, userNameLabel, userStatusLabel, newStatusField, updateStatusButton].forEach { headerContentView.addSubview($0) }

        topConstraint = avatar.topAnchor.constraint(equalTo: headerContentView.topAnchor, constant: 16)
        leadingConstraint = avatar.leadingAnchor.constraint(equalTo: headerContentView.leadingAnchor, constant: 16)
        heightConstraint = avatar.heightAnchor.constraint(equalToConstant: 110)
        widthConstraint = avatar.widthAnchor.constraint(equalToConstant: 110)

        NSLayoutConstraint.activate([
            topConstraint, leadingConstraint, heightConstraint, widthConstraint,

            headerContentView.topAnchor.constraint(equalTo: topAnchor),
            headerContentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerContentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerContentView.bottomAnchor.constraint(equalTo: bottomAnchor),

            userNameLabel.topAnchor.constraint(equalTo: headerContentView.topAnchor, constant: 27),
            userNameLabel.centerXAnchor.constraint(equalTo: headerContentView.centerXAnchor, constant: -20),
            userNameLabel.heightAnchor.constraint(equalToConstant: 18),
            userNameLabel.widthAnchor.constraint(equalToConstant: userNameLabel.intrinsicContentSize.width),

            userStatusLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 45),
            userStatusLabel.leadingAnchor.constraint(equalTo: userNameLabel.leadingAnchor),
            userStatusLabel.heightAnchor.constraint(equalToConstant: 14),

            newStatusField.topAnchor.constraint(equalTo: userStatusLabel.bottomAnchor, constant: 10),
            newStatusField.leadingAnchor.constraint(equalTo: userStatusLabel.leadingAnchor),
            newStatusField.heightAnchor.constraint(equalToConstant: 40),
            newStatusField.trailingAnchor.constraint(equalTo: headerContentView.trailingAnchor, constant: -16),

            updateStatusButton.topAnchor.constraint(equalTo: newStatusField.bottomAnchor, constant: 20),
            updateStatusButton.leadingAnchor.constraint(equalTo: headerContentView.leadingAnchor, constant: 16),
            updateStatusButton.trailingAnchor.constraint(equalTo: headerContentView.trailingAnchor, constant: -16),
            updateStatusButton.bottomAnchor.constraint(equalTo: headerContentView.bottomAnchor, constant: -16),
            updateStatusButton.heightAnchor.constraint(equalToConstant: 50),
            updateStatusButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 32)
        ])
    }

    // MARK: - @objc
    @objc private func statusTextChanged(_ textField: UITextField) {
        statusText = newStatusField.text!
    }

    @objc private func buttonPressed() {
        guard let text = newStatusField.text, !text.isEmpty else { return newStatusField.shakeField(field: newStatusField) }
        userStatusLabel.text = statusText
        newStatusField.text = nil
    }

    @objc func tapImage() {

        headerContentView.addSubview(backgroindImageView)
        backgroindImageView.addSubview(closeButton)
        headerContentView.addSubview(avatar)

        UIView.animateKeyframes(withDuration: 0.8, delay: 0.0) {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.62) {
                self.backgroindImageView.alpha = 0.85
                self.leadingConstraint.constant = 0
                self.topConstraint.constant = self.headerContentView.bounds.height / 2
                self.widthConstraint.constant = self.backgroindImageView.bounds.width
                self.heightConstraint.constant = self.backgroindImageView.bounds.width
                self.avatar.layer.cornerRadius = 0
                self.closeButton.alpha = 0.0
                NSLayoutConstraint.activate([
                    self.closeButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
                    self.closeButton.trailingAnchor.constraint(equalTo: self.backgroindImageView.trailingAnchor, constant: -20),
                ])
                self.layoutIfNeeded()
            }

            UIView.addKeyframe(withRelativeStartTime: 0.62, relativeDuration: 0.38) {
                self.closeButton.alpha = 1
            }
        }
    }

    @objc private func closeButtonTap() {
        UIView.animateKeyframes(withDuration: 0.8, delay: 0.0) {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.38) {
                self.backgroindImageView.alpha = 0.0
                self.closeButton.alpha = 0.0
            }

            UIView.addKeyframe(withRelativeStartTime: 0.38, relativeDuration: 0.62) {
                self.topConstraint.constant = 16
                self.leadingConstraint.constant = 16
                self.heightConstraint.constant = 110
                self.widthConstraint.constant = 110
                self.avatar.layer.cornerRadius = 55
                self.layoutIfNeeded()
            }
        }
    }
}

// MARK: - Extension's
extension ProfileHeaderView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEditing(true)
    }
}
