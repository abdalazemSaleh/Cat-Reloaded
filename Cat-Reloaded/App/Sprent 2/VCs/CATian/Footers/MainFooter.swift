//
//  MainFooter.swift
//  Cat-Reloaded
//
//  Created by Omar Tharwat on 08/12/2022.
//

import Foundation
import UIKit

class CustomTableViewFooter: UITableViewHeaderFooterView {
    
    let logOutButton = GFSimpleButton(title: " Log Out", titleColor: .label)

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        configure()
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomTableViewFooter {
    func configure() {
        contentView.backgroundColor = .white
        logOutButton.setTitleColor(UIColor.darkGray, for: .normal)
        logOutButton.setImage(UIImage(systemName: "rectangle.portrait.and.arrow.right"), for: .normal)
        logOutButton.tintColor = .darkGray
    addSubview(logOutButton)
    NSLayoutConstraint.activate([
        logOutButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 100),
        logOutButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
        logOutButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 40)
    ])


  }
}
