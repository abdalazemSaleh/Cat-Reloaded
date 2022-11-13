//
//  GFErrorLabel.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-11-12.
//

import UIKit

class GFErrorLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    convenience init(text: String) {
        self.init(frame: .zero)
        self.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        textColor   = .systemRed
        font        = UIFont.systemFont(ofSize: 12, weight: .medium)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
