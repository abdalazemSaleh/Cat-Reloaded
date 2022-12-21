//
//  PodCATCell.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-10-13.
//

import Kingfisher
import UIKit

class PodCATCell: UICollectionViewCell {
    
    // MARK: - Variables
    static let reuseIdentifer               = "podCATCell"
    let imageView                   = GFImageView(frame: .zero)
    let padding: CGFloat            = 20
    
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
        
        imageView.image = UIImage(systemName: "photo.fill")
        
        contentView.addSubview(imageView)
        
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 4
        imageView.clipsToBounds = true

        contentView.backgroundColor = .systemBackground
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
    }
    
    func set(_ podCats: PodCatData) {
        let url = URL(string: podCats.thumbnailUrl)
        imageView.kf.setImage(with: url)
    }
}
