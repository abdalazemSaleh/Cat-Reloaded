//
//  ProfileHeader.swift
//  Cat-Reloaded
//
//  Created by Omar Tharwat on 11/12/2022.
//

import UIKit

class ProfileHeader : UITableViewHeaderFooterView {
    // MARK: - Variables
    let userImage           = GFImageView(frame: .zero)
    let stackView           = UIStackView()
    let userName            = GFTitleLabel(textAlignment: .center, fontSize: 16, weight: .bold)
    let viewProfileButton   = GFSimpleButton(title: "View Profile >", titleColor: .darkGray)
    
    // MARK: - initializer
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configure()
        handleUserImage()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
// MARK: - Configure function
extension ProfileHeader {
    func configure() {
        configureUserImageConstraint()
//        configureStackViewConstraint()
        configureUserNameConstraint()
        configureViewProfileButtonConstraint()
    }
}

// MARK: - Functions
extension ProfileHeader {
    func handleUserImage(){
        userImage.image = UIImage(named: "abd")
        userImage.layer.cornerRadius = 40
        userImage.layer.masksToBounds = false
        userImage.clipsToBounds = true
        userImage.layer.borderWidth = 1
        userImage.layer.borderColor = UIColor.secondaryLabel.cgColor
    }
}

// MARK: - constraints
extension ProfileHeader {
    func configureUserImageConstraint() {
        addSubview(userImage)
        
        NSLayoutConstraint.activate([
            userImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            userImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            userImage.heightAnchor.constraint(equalToConstant: 80),
            userImage.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    
    func configureUserNameConstraint() {
        addSubview(userName)
        userName.text = UserData.getUserModel()?.fullName
        
        NSLayoutConstraint.activate([
            userName.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            userName.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: 20)
        ])
    }
    
    func configureViewProfileButtonConstraint() {
        addSubview(viewProfileButton)
        viewProfileButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        
        NSLayoutConstraint.activate([
            viewProfileButton.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: 20),
            viewProfileButton.bottomAnchor.constraint(equalTo: userName.bottomAnchor, constant: 35)
        ])
    }
}

