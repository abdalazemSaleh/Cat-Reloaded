//
//  HeaderCell.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-10-19.
//

import UIKit

struct HomeHeaderCellModel: Hashable {
    let name: String?
}

class HeaderCell: UICollectionViewCell {
    
    // MARK: - Variables
    static let reuseIdentifer   = "HeaderCell"
    
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
}

// MARK: - Configure function
extension HeaderCell {
    func configure() {
        addItemViewToContentView()
        welcomeCardConstraint()
        aboutCatCardConstraint()
    }
}
// MARK: - Handel constraint Extention
extension HeaderCell {
    
    private func addItemViewToContentView() {
        let itemViews   = [welcomeCardStack, aboutCatCardStack]
        for itemView in itemViews {
            contentView.addSubview(itemView)
            NSLayoutConstraint.activate([
                itemView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
                itemView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding)
            ])
        }
    }
    
    /// Welcome card
    func welcomeCardConstraint() {
        welcomeCardTitle.textColor      = Colors.mainColor
        
        welcomeCardStack.axis           = .vertical
        welcomeCardStack.spacing        = 8
        
        welcomeCardStack.addArrangedSubview(welcomeCardTitle)
        welcomeCardStack.addArrangedSubview(welcomeCard)
        
        welcomeCardStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            welcomeCardStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            welcomeCard.heightAnchor.constraint(equalToConstant: 140),
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

// MARK: - Set function
extension HeaderCell {
    func set(welcometitle: String) {
        welcomeCardTitle.text   = welcometitle
    }
}
