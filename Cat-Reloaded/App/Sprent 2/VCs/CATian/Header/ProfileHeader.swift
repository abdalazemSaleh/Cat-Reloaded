//
//  ProfileHeader.swift
//  Cat-Reloaded
//
//  Created by Omar Tharwat on 11/12/2022.
//

import UIKit

class ProfileHeader : UITableViewHeaderFooterView {

let userImage   = GFImageView(frame: .zero)
let profileName = GFTitleLabel(textAlignment: .center, fontSize: 16, weight: .bold)
let viewProfileButton = GFSimpleButton(title: "View Profile >", titleColor: .label)


override init(reuseIdentifier: String?) {
    super.init(reuseIdentifier: reuseIdentifier)
    configure()
    handleUserImage()
    
}

required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
}
}

extension ProfileHeader {
    func configure() {
        addSubview(userImage)
        addSubview(profileName)
        addSubview(viewProfileButton)
        backgroundColor = .systemBackground
        viewProfileButton.setTitleColor(UIColor.darkGray, for: .normal)
        NSLayoutConstraint.activate([
            userImage.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            userImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            userImage.heightAnchor.constraint(equalToConstant: 80),
            userImage.widthAnchor.constraint(equalToConstant: 80),
            
            profileName.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            profileName.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: 20),
            
            viewProfileButton.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: 20),
            viewProfileButton.bottomAnchor.constraint(equalTo: profileName.bottomAnchor, constant: 35)
            
        ])
        profileName.text = "Omar Tharwat"
        
    }
    func handleUserImage(){
        userImage.image = UIImage(named: "5")
        userImage.layer.cornerRadius = 40
        userImage.layer.masksToBounds = false
        userImage.clipsToBounds = true
        userImage.layer.borderWidth = 4
        userImage.layer.borderColor = UIColor.black.cgColor
    }
    
}
