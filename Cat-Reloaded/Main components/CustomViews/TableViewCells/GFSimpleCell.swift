//
//  GFSimpleCell.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2023-02-11.
//

import UIKit

class GFSimpleCell: UITableViewCell {
    
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

extension GFSimpleCell {
    private func configure() {
        backgroundColor = .systemBackground
        selectionStyle = .none
        configureImageView()
        configureRowLabel()
        configureArrowImage()
    }
}
// MARK: - Functions
extension GFSimpleCell {
    private func configureImageView() {
        addSubview(rowImage)
        
        rowImage.tintColor             = Colors.mainColor
        rowImage.layer.masksToBounds   = false
        rowImage.clipsToBounds         = true

        NSLayoutConstraint.activate([
            rowImage.heightAnchor.constraint(equalToConstant: 24),
            rowImage.widthAnchor.constraint(equalToConstant: 24),
            rowImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            rowImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
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

