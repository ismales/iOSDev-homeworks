//
//  String +ext.swift
//  Navigation
//
//  Created by Сманчос on 20.03.2023.
//

import UIKit

extension String {
    var isValid: Bool {
        NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: self)
    }
}


/*
 Example:

 "kenmueller0@gmail.com".isValidEmail   // true

 */
