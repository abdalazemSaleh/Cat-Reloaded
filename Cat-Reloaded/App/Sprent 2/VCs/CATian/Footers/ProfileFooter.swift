//
//  ProfileFooter.swift
//  Cat-Reloaded
//
//  Created by Omar Tharwat on 11/12/2022.
//

import UIKit

class ProfileFooter : UITableViewHeaderFooterView {
    
    let logOutButton = GFSimpleButton(title: " Log Out", titleColor: .label)

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        configure()
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ProfileFooter {
    func configure() {
        addSubview(logOutButton)
        backgroundColor = .white
        logOutButton.setTitleColor(UIColor.darkGray, for: .normal)
        logOutButton.setImage(UIImage(systemName: "rectangle.portrait.and.arrow.right"), for: .normal)
        logOutButton.tintColor = .darkGray
    NSLayoutConstraint.activate([
        logOutButton.topAnchor.constraint(equalTo: topAnchor, constant: 100),
        logOutButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
        logOutButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 40)
    ])


  }
    
}
