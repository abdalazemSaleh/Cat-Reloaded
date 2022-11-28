//
//  BoardingCell.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-10-05.
//

import UIKit

class BoardingCell: UICollectionViewCell {
    
    // MARK: - Variables
    static let cellID               = "BoardingCell"
    
    let imageView                   = GFImageView(frame: .zero)
    let pageControl                 = GFPageControl(frame: .zero)
    let label                       = GFTitleLabel(textAlignment: .center, fontSize: 16, weight: .bold)
    
    let padding: CGFloat            = 20
    
    var itemViews: [UIView]         = []
//    var currentPage: Int            = 0
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
        contentView.backgroundColor = .systemBackground
        label.numberOfLines         = 2
        
        itemViews = [imageView, pageControl, label]
        imageView.contentMode = .scaleAspectFit
        
        for itemView in itemViews {
            contentView.addSubview(itemView)
            NSLayoutConstraint.activate([
                itemView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
                itemView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            ])
        }


        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 196),
            
            pageControl.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: padding),
            pageControl.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: padding),

            label.topAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: padding),
            label.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func set(_ slide: OnboardingSlide) {
        imageView.image = slide.image
        label.text      = slide.description
    }
    
    func getPageNumber(page: Int) {
    }
}
