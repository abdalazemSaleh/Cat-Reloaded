//
//  GFButton.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-10-03.
//

import UIKit

class GFButton: UIButton {    
    let view = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(title: String) {
        self.init(frame: .zero)
        self.setTitle(title, for: .normal)
    }
    
    private func configure() {
        view.addSubview(self)
        view.backgroundColor = .secondarySystemBackground
        
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: view.topAnchor, constant: 4),
            self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 4),
            self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -4),
            self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 8),
            view.heightAnchor.constraint(equalToConstant: 80),
            
        ])
        
        setTitleColor(.white, for: .normal)
        layer.cornerRadius      = 8
        titleLabel?.font        = UIFont.preferredFont(forTextStyle: .headline)
        backgroundColor         = Colors.mainColor
        translatesAutoresizingMaskIntoConstraints = false
    }
        
}
