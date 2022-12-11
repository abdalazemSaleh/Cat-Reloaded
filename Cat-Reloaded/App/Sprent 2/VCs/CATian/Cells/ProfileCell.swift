//
//  ProfileCell.swift
//  Cat-Reloaded
//
//  Created by Omar Tharwat on 11/12/2022.
//

import UIKit

class ProfileCell : UITableViewCell {
    let imageCell   = GFImageView(frame: .zero)
    let labelCell = GFTitleLabel(textAlignment: .center, fontSize: 16, weight: .bold)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
        handleImageCell()
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProfileCell {
    func configure() {
        addSubview(imageCell)
        addSubview(labelCell)
        backgroundColor = .white
    NSLayoutConstraint.activate([
        imageCell.heightAnchor.constraint(equalToConstant: 60),
        imageCell.widthAnchor.constraint(equalToConstant: 60),
        imageCell.topAnchor.constraint(equalTo: topAnchor, constant: 10),
        imageCell.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
      
        labelCell.leadingAnchor.constraint(equalTo: imageCell.trailingAnchor, constant: 20),
        labelCell.topAnchor.constraint(equalTo: topAnchor, constant: 35)
    ])
        labelCell.text = "Omar Tharwat"

  }
    
    func handleImageCell(){
       imageCell.image = UIImage(named: "2")
       imageCell.layer.cornerRadius = 30
       imageCell.layer.masksToBounds = false
       imageCell.clipsToBounds = true
    }
}
