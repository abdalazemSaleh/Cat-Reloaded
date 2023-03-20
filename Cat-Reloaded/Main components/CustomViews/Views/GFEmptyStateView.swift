//
//  GFEmptyStateView.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2023-02-07.
//

import UIKit

class GFEmptyStateView: UIView {
    // MARK: - Variables
    let ImageView       = GFImageView(frame: .zero)
    let errorMessage    = GFBodyLabel(textAlignment: .center)
    let retryButton     = GFButton(title: "Retry")
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
//    convenience init(message: String, image: UIImage) {
//        self.init(frame: .zero)
//        errorMessage.text = message
//        ImageView.image = image
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Configure function
    private func configure() {
        addSubview(ImageView)
        addSubview(errorMessage)
        addSubview(retryButton)
        
        ImageView.contentMode = .scaleAspectFit
        
        
        NSLayoutConstraint.activate([
            ImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            ImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            ImageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -80),
            
            errorMessage.topAnchor.constraint(equalTo: ImageView.bottomAnchor, constant: 32),
            errorMessage.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            retryButton.topAnchor.constraint(equalTo: errorMessage.bottomAnchor, constant: 16),
            retryButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            retryButton.heightAnchor.constraint(equalToConstant: 42),
            retryButton.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
}
