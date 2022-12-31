//
//  GFMediaButton.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-10-06.
//

import UIKit

class GFMediaButton: UIButton {

    let image = UIImage()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
        
    convenience init(backgroundColor: UIColor, image: UIImage) {
        self.init(frame: .zero)
        self.backgroundColor    = backgroundColor
        setImage(image, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}
