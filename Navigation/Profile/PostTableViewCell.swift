//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Сманчос on 16.02.2023.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    // MARK: - Propertie's
    private let cellContentView: UIView = {
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

    private let ppImageView: UIImageView = {
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

    private let ppLikesView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()

    private let ppViews: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()

    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Method's
    override func prepareForReuse() {
        super.prepareForReuse()

        ppAuthorLabel.text = ""
        ppImageView.image = nil
        ppDescriptionLabel.text = ""
        ppLikesView.text = ""
        ppViews.text = ""
    }

    func setupCell(post: ProfilePosts) {
        ppAuthorLabel.text = post.author
        ppImageView.image = post.image
        ppDescriptionLabel.text = post.description
        ppLikesView.text = "Likes: \(post.likes)"
        ppViews.text = "Views: \(post.views)"
    }

    private func layout() {
        contentView.addSubview(cellContentView)
        [ppAuthorLabel, ppImageView, ppDescriptionLabel, ppLikesView, ppViews].forEach { cellContentView.addSubview($0) }

        let offset: CGFloat = 16

        NSLayoutConstraint.activate([
            cellContentView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellContentView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellContentView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cellContentView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cellContentView.widthAnchor.constraint(equalTo: contentView.widthAnchor),

            ppAuthorLabel.topAnchor.constraint(equalTo: cellContentView.topAnchor, constant: offset),
            ppAuthorLabel.leadingAnchor.constraint(equalTo: cellContentView.leadingAnchor, constant: offset),
            ppAuthorLabel.trailingAnchor.constraint(equalTo: cellContentView.trailingAnchor, constant: -offset),
            ppAuthorLabel.bottomAnchor.constraint(equalTo: ppImageView.topAnchor, constant: -offset),

            ppImageView.topAnchor.constraint(equalTo: ppAuthorLabel.bottomAnchor),
            ppImageView.leadingAnchor.constraint(equalTo: cellContentView.leadingAnchor),
            ppImageView.trailingAnchor.constraint(equalTo: cellContentView.trailingAnchor),
            ppImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            ppImageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),

            ppDescriptionLabel.topAnchor.constraint(equalTo: ppImageView.bottomAnchor, constant: offset),
            ppDescriptionLabel.leadingAnchor.constraint(equalTo: cellContentView.leadingAnchor, constant: offset),
            ppDescriptionLabel.trailingAnchor.constraint(equalTo: cellContentView.trailingAnchor, constant: -offset),

            ppLikesView.topAnchor.constraint(equalTo: ppDescriptionLabel.bottomAnchor, constant: offset),
            ppLikesView.leadingAnchor.constraint(equalTo: cellContentView.leadingAnchor, constant: offset),
            ppLikesView.bottomAnchor.constraint(equalTo: cellContentView.bottomAnchor, constant: -offset),

            ppViews.topAnchor.constraint(equalTo: ppDescriptionLabel.bottomAnchor, constant: offset),
            ppViews.trailingAnchor.constraint(equalTo: cellContentView.trailingAnchor, constant: -offset),
            ppLikesView.bottomAnchor.constraint(equalTo: cellContentView.bottomAnchor, constant: -offset),
        ])
    }
}
