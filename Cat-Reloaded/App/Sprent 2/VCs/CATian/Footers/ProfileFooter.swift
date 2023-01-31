//
//  ProfileFooter.swift
//  Cat-Reloaded
//
//  Created by Omar Tharwat on 11/12/2022.
//

import UIKit

class ProfileFooter : UITableViewHeaderFooterView {
    // MARK: - Variables
    let log_outButton = GFSimpleButton(title: "Log out", titleColor: .label)

    // MARK: - Initilaizer
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configure()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure function
extension ProfileFooter {
    private func configure() {
        configureLog_outButton()
    }
}

// MARK: - Functions
extension ProfileFooter {
    private func configureLog_outButton() {
        addSubview(log_outButton)
        
        log_outButton.tintColor = .darkGray
        log_outButton.setTitleColor(UIColor.darkGray, for: .normal)
        log_outButton.setImage(UIImage(systemName: "rectangle.portrait.and.arrow.right"), for: .normal)
        
        NSLayoutConstraint.activate([
            log_outButton.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            log_outButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            log_outButton.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
}
