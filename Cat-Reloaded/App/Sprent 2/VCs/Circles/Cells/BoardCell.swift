//
//  BoardCell.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-12-13.
//

import UIKit

class CircleBoardCell: UICollectionViewCell {
    // MARK: - Variables
    static let reuseIdentifer   = "BoardCell"
    
    let borderView              = UIView()
    
    let userImage               = UIImageView()
    
    let indicator               = UIActivityIndicatorView()
    
    let userFirstName           = GFTitleLabel(textAlignment: .center, fontSize: 16, weight: .bold)
    let userLastName            = GFTitleLabel(textAlignment: .center, fontSize: 16, weight: .bold)
    
    let userNameStack           = UIStackView()
    
    let userPossetion           = GFTitleLabel(textAlignment: .center, fontSize: 10, weight: .regular)
    
    let facebook                = GFMediaButton(backgroundColor: .clear, image: UIImage(named: "facebook")!)
    let twitter                 = GFMediaButton(backgroundColor: .clear, image: UIImage(named: "twitter")!)
    let linkedin                = GFMediaButton(backgroundColor: .clear, image: UIImage(named: "linkedin")!)
    let gitHub                  = GFMediaButton(backgroundColor: .clear, image: UIImage(named: "github")!)
    
   var facebookLink : String   = ""
   var twitterLink : String    = ""
   var gitHubLink : String     = ""
   var linkedInLink : String   = ""
    
    let mediaButtonStack        = UIStackView()
    
    var views: [UIView]         = []
    var mediaButtons: [GFMediaButton]  = []
    
    // MARK: - initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        gitHub.tintColor = .red
        gitHub.contentMode = .scaleToFill
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension CircleBoardCell {
    // MARK: - Configure Functions
    private func configure() {
        addSubView()
        configureborderViewConstraint()
        configureIndicator()
        configureUserImageConstraint()
        configureMediaButtonConstraint()
        cnfigureUserNameAndPossetion()
    }
    
    // MARK: - Functions
    private func addSubView() {
        addSubview(borderView)
        views = [userImage, userNameStack, userPossetion, mediaButtonStack]
        for view in views {
            borderView.addSubview(view)
        }
    }
    
    private func configureborderViewConstraint() {
        borderView.layer.borderWidth   = 2
        borderView.layer.cornerRadius  = 4
        borderView.translatesAutoresizingMaskIntoConstraints               = false
        
        NSLayoutConstraint.activate([
            borderView.topAnchor.constraint(equalTo: topAnchor),
            borderView.leadingAnchor.constraint(equalTo: leadingAnchor),
            borderView.trailingAnchor.constraint(equalTo: trailingAnchor),
            borderView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func configureIndicator() {
        userImage.addSubview(indicator)
        
        indicator.translatesAutoresizingMaskIntoConstraints = false
        
        indicator.centerXAnchor.constraint(equalTo: userImage.centerXAnchor).isActive = true
        indicator.centerYAnchor.constraint(equalTo: userImage.centerYAnchor).isActive = true
    }
    
    private func configureUserImageConstraint() {
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
    
    private func cnfigureUserNameAndPossetion() {
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
    
    private func configureMediaButtonConstraint() {
        mediaButtonStack.axis           = .horizontal
        mediaButtonStack.spacing        = 16

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
}

extension CircleBoardCell {
    // MARK: - Set Function
    
    func set(model: TeamBoardModel) {
        userImage.kf.indicatorType = .activity
        userImage.kf.setImage(with: model.imageUrl.URLConvert)
        
        let users = model.name.split(separator: " ")
        userFirstName.text = users.first.map(String.init) ?? ""
        userLastName.text = users.last.map(String.init) ?? ""
        
        userPossetion.text = model.title
        
        let socialMediaLinks: [(GFMediaButton, String)] = [
            (facebook, model.facebookUrl ?? ""),
            (linkedin, model.linkedInUrl ?? ""),
            (twitter, model.twitterUrl ?? ""),
            (gitHub, model.githubUrl ?? "")
        ]
        
        mediaButtons.removeAll()
        mediaButtonStack.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        for (button, link) in socialMediaLinks {
            if !link.isEmpty {
                mediaButtons.append(button)
                button.addTarget(self, action: #selector(socialMediaButtonClicked(_:)), for: .touchUpInside)
            }
        }
        
        for mediaButton in mediaButtons {
            mediaButtonStack.addArrangedSubview(mediaButton)
        }
    }

    @objc func socialMediaButtonClicked(_ sender: UIButton) {
        var link: String?
        
        switch sender {
        case facebook:
            link = facebookLink
        case twitter:
            link = twitterLink
        case linkedin:
            link = linkedInLink
        case gitHub:
            link = gitHubLink
        default:
            break
        }
        
        guard let socialMediaLink = link, !socialMediaLink.isEmpty else {
            return
        }
        
        let type: SocialMediaNav
        
        switch sender {
        case facebook:
            type = .facebook
        case twitter:
            type = .twitter
        case linkedin:
            type = .linkedin
        case gitHub:
            type = .github
        default:
            return
        }
        openSocialMedia(with: socialMediaLink, type: type)
    }
    
    
//    func set(model: TeamBoardModel) {
//        userImage.kf.indicatorType = .activity
//        userImage.kf.setImage(with: model.imageUrl.URLConvert)
//
//        let users           = model.name.split(separator: " ")
//        userFirstName.text  = String(users.first ?? "")
//        userLastName.text   = String(users.last ?? "")
//
//        userPossetion.text  = model.title
//
//        facebookLink        = model.facebookUrl ?? ""
//        linkedInLink        = model.linkedInUrl ?? ""
//        gitHubLink          = model.githubUrl ?? ""
//        twitterLink         = model.twitterUrl ?? ""
//
//        mediaButtonStack.arrangedSubviews.forEach { $0.removeFromSuperview() }
//        mediaButtons.removeAll()
//
//        if !facebookLink.isEmpty {
//            mediaButtons.append(facebook)
//        }
//
//        if !linkedInLink.isEmpty {
//            mediaButtons.append(linkedin)
//        }
//
//        if !twitterLink.isEmpty {
//            mediaButtons.append(twitter)
//        }
//
//        if !gitHubLink.isEmpty {
//            mediaButtons.append(gitHub)
//        }
//
//        for mediaButton in mediaButtons {
//            mediaButtonStack.addArrangedSubview(mediaButton)
//        }
//
//        facebook.addTarget(self, action: #selector(facebookButtonClicked(_:)), for: .touchUpInside)
//        twitter.addTarget(self, action: #selector(twitterClicked(_:)), for: .touchUpInside)
//        linkedin.addTarget(self, action: #selector(linkedInClicked(_:)), for: .touchUpInside)
//        gitHub.addTarget(self, action: #selector(gitHubClicked(_:)), for: .touchUpInside)
//    }
//
//    @objc func facebookButtonClicked(_ sender: UIButton) {
//        openSocialMedia(with: facebookLink, type: .facebook)
//    }
//
//    @objc func twitterClicked(_ sender: UIButton) {
//        guard !twitterLink.isEmpty else { return }
//        openSocialMedia(with: twitterLink, type: .facebook)
//    }
//
//    @objc func linkedInClicked(_ sender: UIButton) {
//        openSocialMedia(with: linkedInLink, type: .facebook)
//    }
//
//    @objc func gitHubClicked(_ sender: UIButton) {
//        openSocialMedia(with: gitHubLink, type: .facebook)
//    }
}

enum SocialMediaType {
    case facebook
    case twitter
    case linkedin
    case github
}
