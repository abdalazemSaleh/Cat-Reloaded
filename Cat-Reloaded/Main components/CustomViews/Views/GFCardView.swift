//
//  GFCardView.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-10-11.
//

import UIKit

class GFCardView: UIView {

    let label               = GFTitleLabel(textAlignment: .left, fontSize: 24, weight: .medium)
    let bodyLabel           = GFTitleLabel(textAlignment: .left, fontSize: 16, weight: .regular)
    let image               = GFImageView(frame: .zero)
    let padding: CGFloat    = 20
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    convenience init(label: String, bodyLabel: String, image: UIImage) {
        self.init(frame: .zero)
        self.label.text     = label
        self.bodyLabel.text = bodyLabel
        self.image.image    = image
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        backgroundColor     = .secondarySystemBackground
        layer.cornerRadius  = 8
        
        addSubview(label)
        addSubview(bodyLabel)
        addSubview(image)
        
        bodyLabel.numberOfLines = 2
                
        configureNSLayoutConstraint()
    }
    
    func configureNSLayoutConstraint() {
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            image.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            image.widthAnchor.constraint(equalToConstant: 88),
            image.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),

            label.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            label.trailingAnchor.constraint(equalTo: image.leadingAnchor, constant: -padding),
            
            bodyLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 8),
            bodyLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            bodyLabel.trailingAnchor.constraint(equalTo: image.leadingAnchor, constant: -padding),
            bodyLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
