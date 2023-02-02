//
//  PostViewController.swift
//  Navigation
//
//  Created by Сманчос on 01.02.2023.
//

import UIKit

final class PostViewController: UIViewController {

    private let textForLabel: Post

    init(textForLabel: Post) {
        self.textForLabel = textForLabel
        super.init(nibName: nil, bundle: nil)
    }

    private let infoPostButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 30, y: 550, width: 120, height: 50))
        button.setTitle("ИНФО", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        return button
    }()

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupPostButton() {
        view.addSubview(infoPostButton)
        infoPostButton.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.3245105861, green: 0.326969422, blue: 0.3208761471, alpha: 1)
        title = textForLabel.title
        setupPostButton()
    }

    @objc private func tapAction() {
        let infoVC = InfoViewController()
        present(infoVC, animated: true)
    }

}

struct Post {
    var title: String
}
