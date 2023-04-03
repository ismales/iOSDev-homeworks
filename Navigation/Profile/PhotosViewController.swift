//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Сманчос on 21.02.2023.
//

import UIKit

final class PhotosViewController: UIViewController {

    // MARK: - Propertie's
    private let profilePhotos: [ProfilePhotos] =  ProfilePhotos.createMockPofilePhotos()

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)
        return collectionView
    }()

    private let animatingImageView: UIImageView = { // for animate
        let imageView = UIImageView()
        return imageView
    }()

    private let backgroindImageView: UIView = { // for animate
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        view.alpha = 0.85
        view.backgroundColor = .black
        return view
    }()

    private lazy var closeButton: UIButton = { //for animate
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(closeButtonTap), for: .touchUpInside)
        return button
    }()

    private var initialImageRect: CGRect = .zero
    
    // MARK: - Lifecicle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        navigationController?.navigationBar.isHidden = true
    }

    // MARK: - Method's
    private func setupView() {
        view.backgroundColor = .lightGray
        view.addSubview(collectionView)
        navigationItem.title = "Галлерея"

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    private func tapImage(_ image: UIImage?, imageFrame: CGRect) {
        view.addSubview(backgroindImageView)
        view.addSubview(closeButton)
        view.addSubview(animatingImageView)

        animatingImageView.image = image
        animatingImageView.frame = CGRect(x: imageFrame.origin.x,
                                          y: imageFrame.origin.y,
                                          width: imageFrame.width,
                                          height: imageFrame.height)
        animatingImageView.contentMode = .scaleAspectFill
        animatingImageView.clipsToBounds = true

        UIView.animateKeyframes(withDuration: 0.8, delay: 0.0) {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.62) {
                self.backgroindImageView.alpha = 0.85
                self.animatingImageView.alpha = 1.0
                self.animatingImageView.frame.size = CGSize(width: UIScreen.main.bounds.width,
                                                            height: UIScreen.main.bounds.width)
                self.animatingImageView.center = self.view.center
                self.closeButton.alpha = 0.0
                NSLayoutConstraint.activate([
                    self.closeButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
                    self.closeButton.trailingAnchor.constraint(equalTo: self.backgroindImageView.trailingAnchor, constant: -20),
                ])
                self.view.layoutIfNeeded()
            }

            UIView.addKeyframe(withRelativeStartTime: 0.62, relativeDuration: 0.38) {
                self.closeButton.alpha = 1
            }
        }
    }
    
    private func imageInitialFrame(rect: CGRect) {
        self.animatingImageView.frame = rect
    }

    @objc private func closeButtonTap() {
        UIView.animateKeyframes(withDuration: 0.8, delay: 0.0) {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.38) {
                self.backgroindImageView.alpha = 0.0
                self.closeButton.alpha = 0.0
            }

            UIView.addKeyframe(withRelativeStartTime: 0.38, relativeDuration: 0.62) {
                self.imageInitialFrame(rect: self.initialImageRect)
                self.view.layoutIfNeeded()
            }
        } completion: { _ in
            self.closeButton.removeFromSuperview()
            self.backgroindImageView.removeFromSuperview()
            self.animatingImageView.removeFromSuperview()
        }
    }
}

// MARK: - Extensin's
extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        profilePhotos.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier, for: indexPath) as! PhotosCollectionViewCell
        cell.setupCell(photo: profilePhotos[indexPath.item])
        cell.delegate = self
        cell.setIndexPath(indexPath)
        return cell
    }
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    private var inset: CGFloat { return 8 }
    private var elementCount: CGFloat { return 3 }
    private var insetsCount: CGFloat { return elementCount + 1 }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let side = (collectionView.bounds.width - inset * insetsCount) / elementCount
        return CGSize(width: side, height: side)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        inset
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
}

extension PhotosViewController: PhotosCollectionViewCellDelegate {
    func imageTapped(_ image: UIImage?, frameImage: CGRect, indexPath: IndexPath) {
        let rectCell = collectionView.layoutAttributesForItem(at: indexPath)?.frame
        let rectFrame = collectionView.convert(rectCell!, to: collectionView.superview)

        initialImageRect = CGRect(x: frameImage.origin.x + rectFrame.origin.x,
                                  y: frameImage.origin.y + rectFrame.origin.y,
                                  width: frameImage.width,
                                  height: frameImage.height)

        tapImage(image, imageFrame: initialImageRect)
    }
}
