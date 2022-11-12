//
//  HeaderCell.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-10-19.
//

import UIKit

class HeaderCell: UICollectionViewCell {
    
    // MARK: - Variables
    static let reuseIdentifer          = "HeaderCell"
    
    let welcomeCardTitle        = GFTitleLabel(textAlignment: .left, fontSize: 24, weight: .bold)
    let welcomeCard             = GFCardView(label: "Become a CATian", bodyLabel: "Get new experiences with us and we are engoy this.", image: Images.becomACATian!)
    let welcomeCardStack        = UIStackView()
        
    let aboutCatTitle            = GFTitleLabel(textAlignment: .left, fontSize: 24, weight: .bold)
    let aboutCatCard             = GFCardView(label: "", bodyLabel: "Know more about CAT world", image: Images.becomACATian!)
    let aboutCatCardStack        = UIStackView()
    
    let padding: CGFloat         = 20
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    // MARK: - comfigure function
    func configure() {
        welcomeCardConstraint()
        aboutCatCardConstraint()
    }
    
    // MARK: - Set func
    func set(welcometitle: String, aboutTitle: String) {
        welcomeCardTitle.text   = welcometitle
        aboutCatTitle.text      = aboutTitle
    }
}
// MARK: - Handel constraint Extention
extension HeaderCell {
    
    /// Welcome card
    func welcomeCardConstraint() {
        contentView.addSubview(welcomeCardStack)
        
        welcomeCardTitle.textColor      = Colors.mainColor
        welcomeCardTitle.text           = "Welcome Abdalazem"
        
        welcomeCardStack.axis           = .vertical
        welcomeCardStack.spacing        = 8
        
        welcomeCardStack.addArrangedSubview(welcomeCardTitle)
        welcomeCardStack.addArrangedSubview(welcomeCard)
        
        welcomeCardStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            welcomeCardStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            welcomeCard.heightAnchor.constraint(equalToConstant: 140)
        ])
    }
    /// About cat card
    func aboutCatCardConstraint() {
        contentView.addSubview(aboutCatCardStack)
        
        aboutCatTitle.textColor     = Colors.mainColor
        aboutCatTitle.text          = "About CAT"
        
        aboutCatCardStack.axis      = .vertical
        aboutCatCardStack.spacing   = 8
        
        aboutCatCardStack.addArrangedSubview(aboutCatTitle)
        aboutCatCardStack.addArrangedSubview(aboutCatCard)
        
        aboutCatCardStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            aboutCatCardStack.topAnchor.constraint(equalTo: welcomeCardStack.bottomAnchor, constant: padding),
            aboutCatCard.heightAnchor.constraint(equalToConstant: 140)
        ])
    }
}
