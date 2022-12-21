//
//  CircleBoardCell.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-12-13.
//

import UIKit
import Kingfisher

class CircleBoardCell: UICollectionViewCell {
    // MARK: - Variables
    static let reuseIdentifer   = "BoardCell"
    
    let borderView              = UIView()
    
    let userImage               = UIImageView()
    
    let userFirstName           = GFTitleLabel(textAlignment: .center, fontSize: 16, weight: .bold)
    let userLastName            = GFTitleLabel(textAlignment: .center, fontSize: 16, weight: .bold)
    
    let userNameStack           = UIStackView()
    
    let userPossetion           = GFTitleLabel(textAlignment: .center, fontSize: 10, weight: .regular)
    
    let facebook                = GFMediaButton(backgroundColor: .clear, image: UIImage(named: "facebook1")!)
    let twitter                 = GFMediaButton(backgroundColor: .clear, image: UIImage(named: "twitter")!)
    let linkedin                = GFMediaButton(backgroundColor: .clear, image: UIImage(named: "linkedin")!)
    
    let mediaButtonStack        = UIStackView()
    
    var views: [UIView]         = []
    var mediaButtons: [GFMediaButton]  = []
    
    // MARK: - initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configure Functions
    private func configure() {
        addSubView()
        configureborderViewConstraint()
        configureUserImageConstraint()
        configureMediaButtonConstraint()
        cnfigureUserNameAndPossetion()
    }
    
    // MARK: - Functions
    func addSubView() {
        addSubview(borderView)
        views = [userImage, userNameStack, userPossetion, mediaButtonStack]
        for view in views {
            borderView.addSubview(view)
        }
    }
    
    func configureborderViewConstraint() {
        borderView.layer.borderWidth   = 1
        borderView.layer.borderColor   = Colors.mainColor?.cgColor
        borderView.layer.cornerRadius  = 4
        borderView.translatesAutoresizingMaskIntoConstraints               = false
        
        NSLayoutConstraint.activate([
            borderView.topAnchor.constraint(equalTo: topAnchor),
            borderView.leadingAnchor.constraint(equalTo: leadingAnchor),
            borderView.trailingAnchor.constraint(equalTo: trailingAnchor),
            borderView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func configureUserImageConstraint() {
        userImage.layer.cornerRadius   = 34
        userImage.layer.masksToBounds  = true
        userImage.translatesAutoresizingMaskIntoConstraints     = false
        
        NSLayoutConstraint.activate([
            userImage.topAnchor.constraint(equalTo: borderView.topAnchor, constant: 8),
            userImage.centerXAnchor.constraint(equalTo: borderView.centerXAnchor),
            userImage.heightAnchor.constraint(equalToConstant: 68),
            userImage.widthAnchor.constraint(equalToConstant: 68),
        ])
    }
    
    func cnfigureUserNameAndPossetion() {
        userNameStack.axis           = .vertical
        userNameStack.spacing        = 4
        
        userNameStack.addArrangedSubview(userFirstName)
        userNameStack.addArrangedSubview(userLastName)
        userNameStack.translatesAutoresizingMaskIntoConstraints = false
        
        userPossetion.textColor = Colors.mainColor
        
        NSLayoutConstraint.activate([
            userNameStack.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: 8),
            userNameStack.centerXAnchor.constraint(equalTo: userImage.centerXAnchor),
            
            userPossetion.topAnchor.constraint(equalTo: userNameStack.bottomAnchor, constant: 8),
            userPossetion.centerXAnchor.constraint(equalTo: userNameStack.centerXAnchor)

        ])
    }
    
    func configureMediaButtonConstraint() {
        mediaButtonStack.axis           = .horizontal
        mediaButtonStack.spacing        = 16

        mediaButtons = [facebook, twitter, linkedin]
        for mediaButton in mediaButtons {
            mediaButtonStack.addArrangedSubview(mediaButton)
        }
        mediaButtonStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            facebook.heightAnchor.constraint(equalToConstant: 24),
            facebook.widthAnchor.constraint(equalToConstant: 24),
            
            twitter.heightAnchor.constraint(equalToConstant: 24),
            twitter.widthAnchor.constraint(equalToConstant: 24),
            
            linkedin.heightAnchor.constraint(equalToConstant: 24),
            linkedin.widthAnchor.constraint(equalToConstant: 24),

            mediaButtonStack.topAnchor.constraint(equalTo: userPossetion.bottomAnchor, constant: 20),
            mediaButtonStack.centerXAnchor.constraint(equalTo: userPossetion.centerXAnchor)
        ])
    }
    
    
    // MARK: - Set Function
    func set(name: String, title: String, imageUrl: String, facebookUrl: String, githubUrl: String, linkedInUrl: String, twitterUrl: String) {
        let url = URL(string: imageUrl)
        userImage.kf.setImage(with: url)
        
        let users           = name.split(separator: " ")
        userFirstName.text  = String(users.first ?? "")
        userLastName.text   = String(users.last ?? "")
    
        userPossetion.text  = title
    }
}
