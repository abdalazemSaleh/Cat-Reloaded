//
//  Full_imageVC.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-12-31.
//

import UIKit

class Full_imageVC: UIViewController {
    // MARK: - Variables
    let backgroundImage     = GFImageView(frame: .zero)
    let indicator           = UIActivityIndicatorView()
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
        configureIndicator()
        configureVisualEffectViewConstraint()
        configureImage()
    }
    
    private func configureIndicator() {
        image.addSubview(indicator)
        
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.centerXAnchor.constraint(equalTo: image.centerXAnchor).isActive = true
        indicator.centerYAnchor.constraint(equalTo: image.centerYAnchor).isActive = true
    }
    
    private func configureVisualEffectViewConstraint() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(dismisVC))
        view.addGestureRecognizer(gesture)

        view.addSubview(backgroundImage)
        backgroundImage.frame = view.bounds
        
        indicator.startAnimating()
        ImageDownloader(urlString: imageUrl).downloadImage { image in
            DispatchQueue.main.async {
                self.indicator.removeFromSuperview()
                self.backgroundImage.image = image
            }
        }
        
        backgroundImage.contentMode = .scaleAspectFit
        
        blurEffectView.frame = view.bounds
        backgroundImage.addSubview(blurEffectView)
    }
        
    private func configureImage() {
        view.addSubview(image)
        image.contentMode = .scaleAspectFit
        
        indicator.startAnimating()
        ImageDownloader(urlString: imageUrl).downloadImage { image in
            DispatchQueue.main.async {
                self.indicator.removeFromSuperview()
                self.image.image = image
            }
        }

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
