//
//  Textfield +ext.swift
//  Navigation
//
//  Created by Сманчос on 20.03.2023.
//

import UIKit

extension UITextField {
    func shakeField(field: UITextField) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 4
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: field.center.x - 5, y: field.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: field.center.x + 5, y: field.center.y))
        field.layer.add(animation, forKey: "position")
    }
}
