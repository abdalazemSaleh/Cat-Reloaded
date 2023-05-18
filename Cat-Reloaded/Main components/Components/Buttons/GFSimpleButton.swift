//
//  GFSimpleButton.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-10-04.
//

import UIKit

class GFSimpleButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    convenience init(title: String, titleColor: UIColor) {
        self.init(frame: .zero)
        setTitleColor(titleColor, for: .normal)
        setTitle(title, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
