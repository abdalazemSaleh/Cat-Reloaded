//
//  ImageContainerCell.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2023-02-05.
//

import UIKit

class ImageContainerCell: UICollectionViewCell {
    
    // MARK: - Variables
    let imageView = GFImageView(frame: .zero)
    let padding: CGFloat = 20

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configure function
    func configure() {
        contentView.addSubview(imageView)

        contentView.backgroundColor = .systemBackground
        
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 4
        imageView.clipsToBounds = true
                        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
