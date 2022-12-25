//
//  Full_imageVC.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-12-19.
//

import UIKit
import Kingfisher

class Full_imageVC: UIViewController {
    // MARK: - Variables
    let backgroundImage     = GFImageView(frame: .zero)
    let blurEffectView      = UIVisualEffectView(effect: UIBlurEffect(style: .regular))
    let cancelButton        = UIButton()
    let image               = GFImageView(frame: .zero)
    var imageUrl            = ""
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = .clear
    }
    // MARK: - Functions
    private func configure() {
        configureVisualEffectViewConstraint()
        configureImage()
    }
    
    private func configureVisualEffectViewConstraint() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(dismisVC))
        view.addGestureRecognizer(gesture)

        view.addSubview(backgroundImage)
        backgroundImage.frame = view.bounds
        let myUrl = URL(string: imageUrl)
        backgroundImage.kf.setImage(with: myUrl)
        backgroundImage.contentMode = .scaleAspectFit
        
        blurEffectView.frame = view.bounds
        backgroundImage.addSubview(blurEffectView)
    }
        
    private func configureImage() {
        view.addSubview(image)
        image.contentMode = .scaleAspectFit
        let url = URL(string: imageUrl)
        image.kf.setImage(with: url)

        NSLayoutConstraint.activate([
            image.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            image.heightAnchor.constraint(equalToConstant: 320)
        ])
    }
        
    @objc private func dismisVC() {
        dismiss(animated: true)
    }
}
