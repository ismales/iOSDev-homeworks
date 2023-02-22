//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Сманчос on 21.02.2023.
//

import UIKit

final class PhotosCollectionViewCell: UICollectionViewCell {

    // MARK: - Propertie's
    private let image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Method's
    override func layoutSubviews() {
        super.layoutSubviews()

        layout()
    }

    func setupCell(photo: ProfilePhotos) {
        image.image = photo.image
    }

    private func layout() {
        contentView.addSubview(image)

        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: contentView.topAnchor),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
