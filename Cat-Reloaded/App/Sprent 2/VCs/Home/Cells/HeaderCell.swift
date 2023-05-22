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
    
    let cardsStackView           = UIStackView()
    
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
    private func configure() {
        configuerCardsStackView()
    }
}
// MARK: - Handel constraint Extention
extension HeaderCell {
    
    private func configuerCardsStackView() {
        addSubview(cardsStackView)
        
        welcomeCardConstraint()
        aboutCatCardConstraint()
        cardsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        cardsStackView.addArrangedSubview(welcomeCardStack)
        cardsStackView.addArrangedSubview(aboutCatCardStack)
        
        cardsStackView.axis = .vertical
        cardsStackView.spacing = padding
        
        let constraintPadding = UIEdgeInsets(top: padding, left: padding, bottom: 0, right: padding)
        cardsStackView.makeConstraints(topAnchor: topAnchor,
                                       leadingAnchor: leadingAnchor,
                                       trailingAnchor: trailingAnchor,
                                       padding: constraintPadding)
    }
    
    /// Welcome card
    func welcomeCardConstraint() {
        welcomeCardTitle.textColor      = Colors.mainColor
        
        welcomeCardStack.axis           = .vertical
        welcomeCardStack.spacing        = 8
        
        welcomeCardStack.addArrangedSubview(welcomeCardTitle)
        welcomeCardStack.addArrangedSubview(welcomeCard)
        
        welcomeCardStack.translatesAutoresizingMaskIntoConstraints = false
        
        welcomeCard.makeConstraints(size: CGSize(width: 0, height: 140))
    }
    
    /// About cat card
    func aboutCatCardConstraint() {
        aboutCatTitle.textColor     = Colors.mainColor
        aboutCatTitle.text          = "About CAT"
        
        aboutCatCardStack.axis      = .vertical
        aboutCatCardStack.spacing   = 8
        
        aboutCatCardStack.addArrangedSubview(aboutCatTitle)
        aboutCatCardStack.addArrangedSubview(aboutCatCard)
        
        aboutCatCardStack.translatesAutoresizingMaskIntoConstraints = false
        
        aboutCatCard.makeConstraints(size: CGSize(width: 0, height: 140))
    }
}

// MARK: - Set function
extension HeaderCell {
    func set(welcometitle: String, isCatian: Bool) {
        if isCatian {
            welcomeCardStack.removeFromSuperview()
        } else {
            let users = welcometitle.split(separator: " ")
            welcomeCardTitle.text   = ""
            let title = "Welcome" + " " + (users.first?.capitalized ?? "")
            var charIndex   = 0.0
            for character in title {
                Timer.scheduledTimer(withTimeInterval: 0.09 * charIndex, repeats: false){ (timer) in
                    self.welcomeCardTitle.text?.append(character)
                }
                charIndex += 1
            }
        }
    }
}
