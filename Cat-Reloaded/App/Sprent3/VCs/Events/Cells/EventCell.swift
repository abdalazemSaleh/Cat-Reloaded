//
//  EventCell.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2023-02-03.
//

import UIKit

class EventCell: UICollectionViewCell {
    
    // MARK: - Variables
    static let reuseIdentifer = "EventCell"
    
    let imageView             = GFImageView(frame: .zero)
    let sessionName           = GFTitleLabel(textAlignment: .left, fontSize: 16, weight: .bold)
    let sessionDate           = GFTitleLabel(textAlignment: .right, fontSize: 16, weight: .semibold)
        
    let padding: CGFloat      = 20
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemBackground
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configure function
    func configure() {
        contentView.addSubview(imageView)
        contentView.addSubview(sessionName)
        contentView.addSubview(sessionDate)
        
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 4
        imageView.clipsToBounds = true
                
        NSLayoutConstraint.activate([
                        
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            
            sessionName.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            sessionName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            
            sessionDate.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            sessionDate.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    func set(_ model: EventModel) {
        guard model.id != "NoData" else { return }
        imageView.kf.setImage(with: model.imageUrl.URLConvert)
        imageView.kf.indicatorType = .activity
        sessionName.text = model.name
        sessionDate.text = model.startDate.formattedDate
    }
}
