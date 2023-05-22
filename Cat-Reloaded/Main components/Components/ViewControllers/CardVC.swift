//
//  CardVC.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2023-04-24.
//

import UIKit
import Kingfisher

class CardVC: UIViewController {

    // MARK: - Variables
    let containerView   = UIView()
    let background      = GFImageView(frame: .zero)
    let catianImage     = GFImageView(frame: .zero)
    let catianName      = GFTitleLabel(textAlignment: .center, fontSize: 24, weight: .bold)
    let catianRole      = GFBodyLabel(textAlignment: .center)
    let catLogo         = GFImageView(frame: .zero)
    
    let catianData      = UserData.getUserModel()
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    // MARK: - Functions
    private func configure() {
        configureView()
        configureCatianData()
        configureContainerView()
        configureCardBackground()
        configureCatianImageView()
        configureCatianName()
        configureCatianRole()
        configureCatLogo()
    }
    
    private func configureView() {
        view.backgroundColor = .black.withAlphaComponent(0.3)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(dismisVC))
        view.addGestureRecognizer(gesture)
    }
            
    private func configureCatianData() {
        guard let urlString = catianData?.imageUrl, let url = URL(string: urlString) else { return }
        catianImage.kf.setImage(with: url, placeholder: Images.person)
        self.catianName.text   = catianData?.fullName ?? "Catian"
        self.catianRole.text   = catianData?.title ?? "Non"
    }
    
    private func configureContainerView() {
        view.addSubview(containerView)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.backgroundColor       = .systemBackground
        containerView.layer.borderWidth     = 2
        containerView.layer.borderColor     = Colors.mainColor?.cgColor
        containerView.layer.cornerRadius    = 8
        
        let padding: CGFloat = view.frame.width / 4
        let containerViewWidth: CGFloat  = view.frame.width - padding
        
        NSLayoutConstraint.activate([
            containerView.widthAnchor.constraint(equalToConstant: containerViewWidth),
            
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func configureCardBackground() {
        containerView.addSubview(background)
        
        background.image = Images.cardBackground
        background.contentMode = .scaleToFill
        background.layer.zPosition = 0
        
        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: containerView.topAnchor, constant:  8),
            background.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant:  16),
            background.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant:  -16),
            background.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant:  -104)
        ])
    }
    
    private func configureCatianImageView() {
        containerView.addSubview(catianImage)
        
        let imageSize: CGFloat = 128
        
        catianImage.layer.borderWidth   = 1
        catianImage.layer.borderColor   = Colors.mainColor?.cgColor
        catianImage.backgroundColor     = .systemBackground
        catianImage.tintColor           = Colors.mainColor
        catianImage.layer.cornerRadius  = imageSize/2
        catianImage.clipsToBounds = true
        catianImage.layer.zPosition = 1
                
        NSLayoutConstraint.activate([
            catianImage.heightAnchor.constraint(equalToConstant: imageSize),
            catianImage.widthAnchor.constraint(equalToConstant: imageSize),
            
            catianImage.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 32),
            catianImage.centerXAnchor.constraint(equalTo: containerView.centerXAnchor)
        ])
        
    }
    
    private func configureCatianName() {
        containerView.addSubview(catianName)
        
        catianName.layer.zPosition = 1

        NSLayoutConstraint.activate([
            catianName.topAnchor.constraint(equalTo: catianImage.bottomAnchor, constant: 24),
            catianName.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            catianName.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8)
        ])
    }
    
    private func configureCatianRole() {
        containerView.addSubview(catianRole)
        
        catianRole.layer.zPosition = 1
        catianRole.backgroundColor      = Colors.mainColor
        catianRole.textColor            = .white
        catianRole.layer.cornerRadius   = 4
        catianRole.clipsToBounds        = true
        
        let font        = UIFont.preferredFont(forTextStyle: .largeTitle)
        let size        = catianData?.techRole?.size(withAttributes: [NSAttributedString.Key.font: font])
        let stringWidth: CGFloat = size!.width
        
        NSLayoutConstraint.activate([
            catianRole.topAnchor.constraint(equalTo: catianName.bottomAnchor, constant: 16),
            catianRole.centerXAnchor.constraint(equalTo: catianName.centerXAnchor),
            catianRole.heightAnchor.constraint(equalToConstant: 32),
            catianRole.widthAnchor.constraint(equalToConstant: stringWidth)
        ])
    }
    
    private func configureCatLogo() {
        containerView.addSubview(catLogo)
        
        catLogo.image = Images.catLogo
        
        let width: CGFloat  = view.frame.width / 3
        
        NSLayoutConstraint.activate([
            catLogo.topAnchor.constraint(equalTo: catianRole.bottomAnchor, constant: 64),
            catLogo.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16),
            catLogo.widthAnchor.constraint(equalToConstant: width),
            catLogo.heightAnchor.constraint(equalToConstant: 48),
            catLogo.centerXAnchor.constraint(equalTo: containerView.centerXAnchor)
        ])
    }
    
    @objc private func dismisVC() {
        dismiss(animated: true)
    }
}
