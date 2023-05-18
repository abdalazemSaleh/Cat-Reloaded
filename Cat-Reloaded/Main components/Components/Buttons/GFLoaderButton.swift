//
//  GFLoaderButton.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2023-03-21.
//

import UIKit

class GFLoaderButton: UIButton {
    // MARK: - Variables
    var isLoading = false {
        didSet {
            configure()
        }
    }
    var spiner = GFActiveIndicator()
    var buttonTitle = ""
    var buttonBackgroundColor = Colors.mainColor

    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    convenience init(buttonTitle: String, buttonBackgroundColor: UIColor) {
        self.init(frame: .zero)
        self.buttonTitle = buttonTitle
        self.buttonBackgroundColor = buttonBackgroundColor
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Functions
    private func configure() {
        self.spiner.frame = CGRect(x: 10, y: 10, width: 32, height: 32)
        
        translatesAutoresizingMaskIntoConstraints = false
        setTitle(buttonTitle, for: .normal)
        backgroundColor = buttonBackgroundColor
        loginButtonConstrains()
    }

    func loginButtonConstrains() {
        if isLoading {
            self.setTitle("", for: .normal)
            self.layer.cornerRadius = 48 / 2
        } else {
            self.setTitle(buttonTitle, for: .normal)
            self.layer.cornerRadius = 8
        }
    }
    
    func startLoadingAnimation() {
        self.addSubview(spiner)
        spiner.frame = CGRect(x: 8, y: 8, width: 32, height: 32)
        spiner.animate()
    }
}

