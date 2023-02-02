//
//  InfoViewController.swift
//  Navigation
//
//  Created by Сманчос on 02.02.2023.
//

import UIKit

class InfoViewController: UIViewController {

    private let lowerDownButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 400, width: 200, height: 50))
        button.setTitle("Уходим?!", for: .normal)
        button.backgroundColor = .black
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupButton()
    }

    private func setupButton() {
        view.addSubview(lowerDownButton)
        lowerDownButton.addTarget(self, action: #selector(lowerDown), for: .touchUpInside)
    }

    @objc private func lowerDown() {
        let alert = UIAlertController(title: "Зачем тебе это", message: "Останься со мной", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Уйти", style: .destructive) { _ in
            self.dismiss(animated: true)
            print("он ушел")
        }
        let cancelAction = UIAlertAction(title: "Лан", style: .default) { _ in
            print("остался")
        }
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
