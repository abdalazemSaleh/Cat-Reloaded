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
    let cancelButton = UIButton()
    let image       = GFImageView(frame: .zero)
    var imageUrl    = ""
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = .systemBackground
    }
    // MARK: - Functions
    private func configure() {
        view.addSubview(image)
        view.addSubview(cancelButton)
        configureCancelButton()
        configureImage()
    }
    
    private func configureCancelButton() {
        cancelButton.backgroundColor    = Colors.mainColor
        cancelButton.layer.cornerRadius = 24
        cancelButton.setImage(UIImage(systemName: "plus"), for: .normal)
        cancelButton.addTarget(self, action: #selector(dismisVC), for: .touchUpInside)
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cancelButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            cancelButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            cancelButton.heightAnchor.constraint(equalToConstant: 48),
            cancelButton.widthAnchor.constraint(equalToConstant: 48)
        ])
    }
    @objc private func dismisVC() {
        dismiss(animated: true)
    }
    
    private func configureImage() {
        image.layer.cornerRadius    = 4
        image.layer.masksToBounds   = true
        let url = URL(string: imageUrl)
        image.kf.setImage(with: url)

        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: cancelButton.bottomAnchor, constant: 64),
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            image.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            image.heightAnchor.constraint(equalToConstant: 180)
        ])
    }
}
