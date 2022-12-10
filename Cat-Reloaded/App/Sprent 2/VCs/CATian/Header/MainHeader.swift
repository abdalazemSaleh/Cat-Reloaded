//
//  MainHeader.swift
//  Cat-Reloaded
//
//  Created by Omar Tharwat on 08/12/2022.
//

import Foundation
import UIKit

class CustomTableViewHeader: UITableViewHeaderFooterView {
    
    let profileImage: UIImageView = {
       let theImageView = UIImageView()
       theImageView.image = UIImage(named: "5")
        theImageView.clipsToBounds = true
        theImageView.layer.cornerRadius = theImageView.frame.width / 2.0
        theImageView.layer.masksToBounds = true
        theImageView.contentMode = UIView.ContentMode.scaleAspectFill
        theImageView.layer.borderWidth = 4
        theImageView.layer.borderColor = UIColor.black.cgColor
        theImageView.translatesAutoresizingMaskIntoConstraints = false
       return theImageView
    }()
    let profileName = GFTitleLabel(textAlignment: .center, fontSize: 16, weight: .bold)
    let viewProfile = GFSimpleButton(title: "View Profile >", titleColor: .label)

    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configure()

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomTableViewHeader {
    func configure() {
        contentView.backgroundColor = .white
        viewProfile.setTitleColor(UIColor.darkGray, for: .normal)
    addSubview(profileImage)
    addSubview(profileName)
    addSubview(viewProfile)
    NSLayoutConstraint.activate([
      profileImage.heightAnchor.constraint(equalToConstant: 80),
      profileImage.widthAnchor.constraint(equalToConstant: 80),
      profileImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
      profileImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10),
      profileImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
      
      profileName.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 20),
      profileName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
      viewProfile.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 20),
      viewProfile.bottomAnchor.constraint(equalTo: profileName.bottomAnchor, constant: 35)
      
    ])
        profileName.text = "Omar Tharwat"

  }

    
}
