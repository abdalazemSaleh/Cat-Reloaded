//
//  BoardCell.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-12-13.
//

import UIKit

class BoardCell: UICollectionViewCell {
    static let reuseIdentifer = "BoardCell"
    
    let view            = UIView()
    let profilePicture  = UIImageView()
    let profileName     = GFTitleLabel(textAlignment: .center, fontSize: 16, weight: .bold)
    let facebook        = GFMediaButton(backgroundColor: .clear, image: UIImage(named: "in")!)
//    let google          = GFMediaButton(backgroundColor: .blue, image: UIImage(named: "gmail")!)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubview(view)
        view.addSubview(profilePicture)
        view.addSubview(profileName)
        view.addSubview(facebook)
//        view.addSubview(google)
        
        view.layer.borderWidth   = 1
        view.layer.borderColor   = Colors.mainColor?.cgColor
        view.layer.cornerRadius  = 4
        
        view.translatesAutoresizingMaskIntoConstraints               = false
        profilePicture.translatesAutoresizingMaskIntoConstraints     = false

        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: topAnchor),
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor),
            view.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            profilePicture.topAnchor.constraint(equalTo: view.topAnchor, constant: 8),
            profilePicture.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profilePicture.heightAnchor.constraint(equalToConstant: 68),
            profilePicture.widthAnchor.constraint(equalToConstant: 68),
            
            profileName.topAnchor.constraint(equalTo: profilePicture.bottomAnchor, constant: 8),
            profileName.centerXAnchor.constraint(equalTo: profilePicture.centerXAnchor),
            
            facebook.topAnchor.constraint(equalTo: profileName.bottomAnchor, constant: 10),
            facebook.heightAnchor.constraint(equalToConstant: 40),
            facebook.widthAnchor.constraint(equalToConstant: 40)
            
        ])
    }
    
    func set(image: String, circleName: String) {
        profilePicture.image    = UIImage(named: image)
        profileName.text        = circleName
    }
}
