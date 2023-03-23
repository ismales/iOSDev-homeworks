//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Сманчос on 21.02.2023.
//

import UIKit

protocol PhotosCollectionViewCellDelegate: AnyObject {
    func imageTapped(_ image: UIImage?, frameImage: CGRect, indexPath: IndexPath)
}

final class PhotosCollectionViewCell: UICollectionViewCell {

    // MARK: - Propertie's
    private let image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.isUserInteractionEnabled = true
        return image
    }()

    private var indexPathCell = IndexPath()

    weak var delegate: PhotosCollectionViewCellDelegate?

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)

        imageTapGesture()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Method's
    override func layoutSubviews() {
        super.layoutSubviews()

        layout()
        imageTapGesture()
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

    func setupCell(photo: ProfilePhotos) {
        image.image = photo.image
    }

    func setIndexPath(_ indexPath: IndexPath) {
        indexPathCell = indexPath
    }

    private func imageTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapImage))
        self.image.addGestureRecognizer(tapGesture)
    }

    @objc private func tapImage() {
        delegate?.imageTapped(image.image, frameImage: image.frame, indexPath: indexPathCell)
    }
}
