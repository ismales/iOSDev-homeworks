//
//  UIView.swift
//  Navigation
//
//  Created by Сманчос on 15.02.2023.
//

import UIKit

extension UITextField {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEditing(true)
        return true
    }
}
