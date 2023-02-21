//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Сманчос on 21.02.2023.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {

    // MARK: - Propertie's
    private let profilePhotos: [ProfilePhotos] =  ProfilePhotos.createMockPofilePhotos()

    private let cellContentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        label.text = "Фотографии"
        return label
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        return stackView
    }()

    private lazy var image1: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = profilePhotos[0].image
        image.layer.cornerRadius = 6
        image.clipsToBounds = true
        return image
    }()

    private lazy var image2: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = profilePhotos[1].image
        image.layer.cornerRadius = 6
        image.clipsToBounds = true
        return image
    }()

    private lazy var image3: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = profilePhotos[2].image
        image.layer.cornerRadius = 6
        image.clipsToBounds = true
        return image
    }()

    private lazy var image4: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = profilePhotos[3].image
        image.layer.cornerRadius = 6
        image.clipsToBounds = true
        return image
    }()
    

    private let goOverImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "arrow.right")
        image.tintColor = .black
        return image
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
    private func layout() {
        contentView.addSubview(cellContentView)
        cellContentView.addSubview(label)
        cellContentView.addSubview(stackView)
        [image1, image2, image3, image4].forEach { stackView.addArrangedSubview($0) }
        cellContentView.addSubview(goOverImage)

        let offset: CGFloat = 12

        NSLayoutConstraint.activate([
            cellContentView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellContentView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellContentView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cellContentView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cellContentView.widthAnchor.constraint(equalTo: contentView.widthAnchor),

            label.topAnchor.constraint(equalTo: cellContentView.topAnchor, constant: offset),
            label.leadingAnchor.constraint(equalTo: cellContentView.leadingAnchor, constant: offset),
            label.heightAnchor.constraint(equalToConstant: 24),
            label.widthAnchor.constraint(equalToConstant: label.intrinsicContentSize.width),

            stackView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: offset),
            stackView.leadingAnchor.constraint(equalTo: cellContentView.leadingAnchor, constant: offset),
            stackView.bottomAnchor.constraint(equalTo: cellContentView.bottomAnchor, constant: -offset),
            stackView.trailingAnchor.constraint(equalTo: cellContentView.trailingAnchor, constant: -offset),
            stackView.widthAnchor.constraint(equalToConstant: contentView.bounds.width - offset * 2),
            stackView.heightAnchor.constraint(equalToConstant: (contentView.bounds.width - offset * 2) / 4),

            goOverImage.centerYAnchor.constraint(equalTo: label.centerYAnchor),
            goOverImage.trailingAnchor.constraint(equalTo: cellContentView.trailingAnchor, constant: -offset)
        ])
    }
}

