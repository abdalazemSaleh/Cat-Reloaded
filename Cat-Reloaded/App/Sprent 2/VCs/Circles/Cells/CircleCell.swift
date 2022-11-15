//
//  CircleCell.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-11-15.
//

import UIKit

class CircleCell: UICollectionViewCell {
    static let reuseIdentifer = "CircleCell"
    
    let view = UIView()
    let imageView   = UIImageView()
    let label  = GFTitleLabel(textAlignment: .center, fontSize: 16, weight: .bold)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubview(view)
        view.addSubview(imageView)
        view.addSubview(label)
        
        view.layer.borderWidth   = 1
        view.layer.borderColor   = Colors.mainColor?.cgColor
        view.layer.cornerRadius  = 4
        
        view.translatesAutoresizingMaskIntoConstraints          = false
        imageView.translatesAutoresizingMaskIntoConstraints     = false
        label.translatesAutoresizingMaskIntoConstraints         = false
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: topAnchor),
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor),
            view.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 8),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 6),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            label.heightAnchor.constraint(equalToConstant: 20),
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8)
        ])
    }
    
    func set(image: String, circleName: String) {
        imageView.image = UIImage(named: image)
        label.text      = circleName
    }
}
