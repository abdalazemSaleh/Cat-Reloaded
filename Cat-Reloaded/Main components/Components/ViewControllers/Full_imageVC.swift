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
    let blurEffectView      = UIVisualEffectView(effect: UIBlurEffect(style: .regular))
    let cancelButton        = UIButton()
    let image               = GFImageView(frame: .zero)
    var imageUrl            = ""
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        image.enableZoom()
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
        
        backgroundImage.kf.setImage(with: URL(string: imageUrl))
        
        backgroundImage.contentMode = .scaleAspectFit
        
        blurEffectView.frame = view.bounds
        backgroundImage.addSubview(blurEffectView)
    }
        
    private func configureImage() {
        view.addSubview(image)
        image.contentMode = .scaleAspectFit
        
        image.kf.indicatorType = .activity
        image.kf.setImage(with: URL(string: imageUrl))

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


extension UIImageView {
    func enableZoom() {
      let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(startZooming(_:)))
      isUserInteractionEnabled = true
      addGestureRecognizer(pinchGesture)
    }

    @objc
    private func startZooming(_ sender: UIPinchGestureRecognizer) {
      let scaleResult = sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale)
      guard let scale = scaleResult, scale.a > 1, scale.d > 1 else { return }
      sender.view?.transform = scale
      sender.scale = 1
    }

}
