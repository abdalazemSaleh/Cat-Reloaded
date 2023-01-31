//
//  ProfileCell.swift
//  Cat-Reloaded
//
//  Created by Omar Tharwat on 11/12/2022.
//

import UIKit

class ProfileCell : UITableViewCell {
    // MARK: - Variables
    let rowImage    = GFImageView(frame: .zero)
    let labelCell   = GFTitleLabel(textAlignment: .left, fontSize: 16, weight: .bold)
    let arrowImage  = GFImageView(frame: .zero)

    // MARK: - Initilaizer
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure function
extension ProfileCell {
    private func configure() {
        backgroundColor = .systemBackground
        configureImageView()
        configureRowLabel()
        configureArrowImage()
    }
}
// MARK: - Functions
extension ProfileCell {
    private func configureImageView() {
        addSubview(rowImage)
        
        rowImage.layer.cornerRadius    = 20
        rowImage.layer.masksToBounds   = false
        rowImage.clipsToBounds         = true

        NSLayoutConstraint.activate([
            rowImage.heightAnchor.constraint(equalToConstant: 40),
            rowImage.widthAnchor.constraint(equalToConstant: 40),
            rowImage.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            rowImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            rowImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
        ])
    }
    
    private func configureRowLabel() {
        addSubview(labelCell)
        NSLayoutConstraint.activate([
            labelCell.leadingAnchor.constraint(equalTo: rowImage.trailingAnchor, constant: 8),
            labelCell.centerYAnchor.constraint(equalTo: rowImage.centerYAnchor)
        ])
    }
    
    private func configureArrowImage() {
        addSubview(arrowImage)
        
        arrowImage.image        = UIImage(systemName: "arrow.right")
        arrowImage.tintColor    = .secondaryLabel
        
        NSLayoutConstraint.activate([
            arrowImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            arrowImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
}

// MARK: - Set function
extension ProfileCell {
    func set(model: CATianModel) {
        rowImage.image  = UIImage(named: model.image)
        labelCell.text  = model.name
    }
}
