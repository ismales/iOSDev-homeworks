//
//  LoginViewController.swift
//  Navigation
//
//  Created by Сманчос on 14.02.2023.
//

import UIKit

final class LoginViewController: UIViewController {
    
    private let notification = NotificationCenter.default

    // MARK: - Propertie's
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .white
        return contentView
    }()
    
    private let vkImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "logo.png")
        return image
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .systemGray6
        stackView.layer.borderWidth = 0.5
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.cornerRadius = 10
        stackView.axis = .vertical
        return stackView
    }()
    
    private let separatorView: UIView = {
        let separator = UIView()
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.layer.borderWidth = 0.5
        separator.layer.borderColor = UIColor.lightGray.cgColor
        return separator
    }()
    
    lazy var loginField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.autocapitalizationType = .none
        textField.backgroundColor = .systemGray6
        textField.delegate = self
        return textField
    }()
    
    lazy var passwordField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Пароль"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = true
        textField.backgroundColor = .systemGray6
        textField.delegate = self
        textField.isSecureTextEntry = true
        textField.clearsOnBeginEditing = false
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Войти", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        button.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner]
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10
        return button
    }()

    private lazy var validLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Логин и пароль должны быть не менее 5 символов"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .red
        label.layer.opacity = 0.7
        label.isHidden = true
        return label
    }()

    private lazy var emailValidLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Некорректный email"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .red
        label.layer.opacity = 0.7
        label.isHidden = true
        return label
    }()

    // MARK: - lifecicle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        notification.addObserver(self, selector: #selector(keybordWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        notification.addObserver(self, selector: #selector(keybordWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        notification.removeObserver(UIResponder.keyboardWillShowNotification)
        notification.removeObserver(UIResponder.keyboardWillHideNotification)
    }

    // MARK: - Method's
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(vkImage)
        contentView.addSubview(stackView)
        contentView.addSubview(loginButton)
        contentView.addSubview(validLabel)
        contentView.addSubview(emailValidLabel)
        
        stackView.addArrangedSubview(loginField)
        stackView.addArrangedSubview(separatorView)
        stackView.addArrangedSubview(passwordField)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            vkImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            vkImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            vkImage.heightAnchor.constraint(equalToConstant: 100),
            vkImage.widthAnchor.constraint(equalToConstant: 100),
            
            stackView.topAnchor.constraint(equalTo: vkImage.bottomAnchor, constant: 120),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stackView.heightAnchor.constraint(equalToConstant: 100),
            
            loginField.topAnchor.constraint(equalTo: stackView.topAnchor),
            loginField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 14),
            loginField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            loginField.bottomAnchor.constraint(equalTo: separatorView.topAnchor),
            loginField.heightAnchor.constraint(equalToConstant: 50),
            
            separatorView.topAnchor.constraint(equalTo: loginField.bottomAnchor),
            separatorView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 0.5),
            
            passwordField.topAnchor.constraint(equalTo: separatorView.bottomAnchor),
            passwordField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 14),
            passwordField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            passwordField.heightAnchor.constraint(equalToConstant: 50),
            passwordField.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
            
            loginButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16),
            loginButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 50),

            validLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            validLabel.centerXAnchor.constraint(equalTo: loginButton.centerXAnchor),

            emailValidLabel.topAnchor.constraint(equalTo: validLabel.bottomAnchor),
            emailValidLabel.centerXAnchor.constraint(equalTo: loginButton.centerXAnchor),
            emailValidLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    // MARK: - @objc
    @objc private func keybordWillShow(notification: NSNotification) {
        if let keybordSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keybordSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keybordSize.height, right: 0)
        }
    }
    
    @objc private func keybordWillHide() {
        scrollView.contentInset = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
}

// MARK: - Extension's

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if loginField.text?.count ?? 0 < 5 && passwordField.text?.count ?? 0 < 5 {
            validLabel.isHidden = false
            emailValidLabel.isHidden = false
        }
        return true
    }

    func textFieldDidChangeSelection(_ textField: UITextField) {
        if loginField.text?.isValid ?? false {
            emailValidLabel.isHidden = true
        } else {
            emailValidLabel.isHidden = false
        }

        if loginField.text?.count ?? 0 >= 5 && passwordField.text?.count ?? 0 >= 5 {
            validLabel.isHidden = true
        } else {
            validLabel.isHidden = false
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
    }
}
