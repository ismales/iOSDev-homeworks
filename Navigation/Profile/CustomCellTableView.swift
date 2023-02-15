//
//  CustomCellTableView.swift
//  Navigation
//
//  Created by Сманчос on 14.02.2023.
//

import UIKit

class CustomCellTableView: UITableViewCell {

    private let cell: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray6
        view.layer.borderColor = UIColor.lightGray.cgColor
        return view
    }()

    private lazy var field: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = true
        textField.backgroundColor = .systemGray6
        textField.delegate = self
        return textField
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        cofigure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupFieldInCell(_ field: UITextField) {
        self.field.placeholder = field.placeholder
        self.field.isSecureTextEntry = field.isSecureTextEntry
    }

    private func cofigure() {
        contentView.addSubview(cell)
        contentView.addSubview(field)

        NSLayoutConstraint.activate([
            cell.topAnchor.constraint(equalTo: contentView.topAnchor),
            cell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cell.heightAnchor.constraint(equalToConstant: 50),

            field.topAnchor.constraint(equalTo: cell.topAnchor),
            field.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 16),
            field.trailingAnchor.constraint(equalTo: cell.trailingAnchor),
            field.bottomAnchor.constraint(equalTo: cell.bottomAnchor)
        ])
    }
}

extension UIView {
    static var id: String {
        String(describing: self)
    }
}

extension CustomCellTableView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEditing(true)
        return true
    }
}
