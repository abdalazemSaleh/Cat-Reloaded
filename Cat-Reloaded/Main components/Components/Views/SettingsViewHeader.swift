//
//  SettingsViewHeader.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2023-04-24.
//

import UIKit

class SettingsHeaderView: UIView {
    // Components
    let rowImage            = GFImageView(frame: .zero)
    let labelCell           = GFTitleLabel(textAlignment: .left, fontSize: 16, weight: .bold)
    let arrowImage          = GFImageView(frame: .zero)
    let appearanceLabel     = GFBodyLabel(textAlignment: .center)
    let button              = GFSimpleButton()
    
    // Variables
    var buttonAction: (() -> Void)?
    
    // initilizer
    override init(frame: CGRect) {
        super.init(frame: frame)
        buttonAction = nil
        configure()
    }
    
    convenience init(labelCell: String, appearanceLabel: String, rowImage: UIImage, buttonAction: (() -> Void)?) {
        self.init(frame: .zero)
        self.buttonAction = buttonAction
        button.addTarget(self, action: #selector(hideSection), for: .touchUpInside)
        configureViews(labelCell: labelCell, appearanceLabel: appearanceLabel, rowImage: rowImage)
    }
    
    @objc private func hideSection() {
        buttonAction?()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // Setup
    private func configure() {
        addSubViews()
        configureConstraint()
    }
    
    private func addSubViews() {
        let views = [button, rowImage, labelCell, appearanceLabel, arrowImage]
        for view in views {
            addSubview(view)
        }
    }
        
    private func configureViews(labelCell: String, appearanceLabel: String, rowImage: UIImage) {
        self.labelCell.text          = labelCell
        self.appearanceLabel.text    = appearanceLabel
        self.rowImage.image          = rowImage
        self.rowImage.tintColor      = Colors.mainColor
        self.arrowImage.image        = UIImage(systemName: "chevron.down")
        self.arrowImage.tintColor    = .secondaryLabel
    }
    
    private func configureConstraint() {
        NSLayoutConstraint.activate([
            rowImage.heightAnchor.constraint(equalToConstant: 24),
            rowImage.widthAnchor.constraint(equalToConstant: 24),
            rowImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            rowImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),

            labelCell.leadingAnchor.constraint(equalTo: rowImage.trailingAnchor, constant: 8),
            labelCell.centerYAnchor.constraint(equalTo: rowImage.centerYAnchor),
            
            arrowImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            arrowImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            appearanceLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            appearanceLabel.trailingAnchor.constraint(equalTo: arrowImage.leadingAnchor, constant: -8),
            
            button.topAnchor.constraint(equalTo: topAnchor),
            button.leadingAnchor.constraint(equalTo: leadingAnchor),
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

