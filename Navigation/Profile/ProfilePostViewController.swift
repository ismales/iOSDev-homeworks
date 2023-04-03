//
//  ProfilePostViewController.swift
//  Navigation
//
//  Created by Сманчос on 20.03.2023.
//

import UIKit

class ProfilePostViewController: UIViewController {

    // MARK: - Propertie's
    private var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let ppAuthorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 2
        return label
    }()

    let ppImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .black
        return image
    }()

    private let ppDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .systemGray
        label.numberOfLines = 0
        return label
    }()

    let ppLikesView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.isUserInteractionEnabled = true
        return label
    }()

    private let ppViews: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()

    // MARK: - Lifecicle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray

        layout()
    }

    // MARK: - Method's
    func setupCell(post: ProfilePosts) {
        ppAuthorLabel.text = post.author
        ppImageView.image = post.image
        ppDescriptionLabel.text = post.description
        ppLikesView.text = "Likes: \(post.likes)"
        ppViews.text = "Views: \(post.views)"
    }

    private func layout() {
        view.addSubview(contentView)
        [ppAuthorLabel, ppImageView, ppDescriptionLabel, ppLikesView, ppViews].forEach { contentView.addSubview($0) }

        let offset: CGFloat = 16

        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            ppAuthorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: offset),
            ppAuthorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: offset),
            ppAuthorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -offset),
            ppAuthorLabel.heightAnchor.constraint(equalToConstant: 60),

            ppImageView.topAnchor.constraint(equalTo: ppAuthorLabel.bottomAnchor),
            ppImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            ppImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            ppImageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),

            ppDescriptionLabel.topAnchor.constraint(equalTo: ppImageView.bottomAnchor, constant: offset),
            ppDescriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: offset),
            ppDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -offset),

            ppLikesView.topAnchor.constraint(equalTo: ppDescriptionLabel.bottomAnchor, constant: offset),
            ppLikesView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: offset),
            ppLikesView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -offset),

            ppViews.topAnchor.constraint(equalTo: ppDescriptionLabel.bottomAnchor, constant: offset),
            ppViews.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -offset),
            ppLikesView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -offset),
        ])
    }
}
