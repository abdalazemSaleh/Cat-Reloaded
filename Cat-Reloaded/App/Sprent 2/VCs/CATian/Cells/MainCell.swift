//
//  MainCell.swift
//  Cat-Reloaded
//
//  Created by Omar Tharwat on 08/12/2022.
//

import Foundation
import UIKit

class CustomTableCell: UITableViewCell {
    
    let imageCell: UIImageView = {
       let theImageView = UIImageView()
       theImageView.image = UIImage(named: "2")
        theImageView.clipsToBounds = true
        theImageView.layer.cornerRadius = theImageView.frame.width / 2.0
        theImageView.layer.masksToBounds = true
        theImageView.contentMode = UIView.ContentMode.scaleAspectFill
        theImageView.translatesAutoresizingMaskIntoConstraints = false
       return theImageView
    }()
    let labelCell = GFTitleLabel(textAlignment: .center, fontSize: 16, weight: .bold)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomTableCell {
    func configure() {
        contentView.backgroundColor = .white
    addSubview(imageCell)
    addSubview(labelCell)
    NSLayoutConstraint.activate([
        imageCell.heightAnchor.constraint(equalToConstant: 60),
        imageCell.widthAnchor.constraint(equalToConstant: 60),
        imageCell.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
        imageCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10),
        imageCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
      
        labelCell.leadingAnchor.constraint(equalTo: imageCell.trailingAnchor, constant: 20),
        labelCell.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 35)
    ])
        labelCell.text = "Omar Tharwat"

  }
}
