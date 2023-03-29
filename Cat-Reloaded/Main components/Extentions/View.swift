//
//  View.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2023-03-29.
//

import UIKit

extension UIView {
    func addShadow() {
        self.layer.shadowColor = UIColor.label.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 5
    }
}
