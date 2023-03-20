//
//  ProfileVC.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2023-02-11.
//

import UIKit

class ProfileVC: UIViewController {
    // MARK: - Variables
    /// User image
    let userImage = GFImageView(frame: .zero)
    /// Text fields
    let fullNameLabel           = GFTitleLabel(textAlignment: .left, fontSize: 16, weight: .bold)
    let fullNameTextField       = GFTextField(placeholder: "Full name")
    let fullNameContainer       = UIStackView()
    
    let phoneNumberLabel        = GFTitleLabel(textAlignment: .left, fontSize: 16, weight: .bold)
    let phoneNumberTextField    = GFTextField(placeholder: "Phone number")
    let phoneNumberContainer    = UIStackView()
    
    let emailLabel              = GFTitleLabel(textAlignment: .left, fontSize: 16, weight: .bold)
    let emailTextField          = GFTextField(placeholder: "Email")
    let emailContainer          = UIStackView()
    
    let stackView               = UIStackView()
    /// Buttons
    let saveButton              = GFButton(title: "Save")

    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // User image
        view.addSubview(userImage)
        userImage.image = UIImage(named: "abd")
        userImage.layer.borderWidth = 2
        userImage.layer.borderColor = UIColor.label.cgColor
        userImage.layer.cornerRadius = 128/2
        userImage.clipsToBounds = true
        
        // User name
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(fullNameContainer)
        stackView.addArrangedSubview(phoneNumberContainer)
        stackView.addArrangedSubview(emailContainer)
        stackView.axis = .vertical
        stackView.spacing = 16
        
        fullNameLabel.text = " Full Name"
        fullNameTextField.text = UserData.getUserModel()?.fullName
        fullNameContainer.addArrangedSubview(fullNameLabel)
        fullNameContainer.addArrangedSubview(fullNameTextField)
        
        fullNameContainer.axis         = .vertical
        fullNameContainer.spacing      = 4
        
        phoneNumberLabel.text = " Phone Number"
        phoneNumberTextField.text = UserData.getUserModel()?.phoneNumber
        phoneNumberContainer.addArrangedSubview(phoneNumberLabel)
        phoneNumberContainer.addArrangedSubview(phoneNumberTextField)
        
        phoneNumberContainer.axis         = .vertical
        phoneNumberContainer.spacing      = 4

        emailLabel.text = " Email"
        emailTextField.text = UserData.getUserModel()?.email
        emailContainer.addArrangedSubview(emailLabel)
        emailContainer.addArrangedSubview(emailTextField)
        
        emailContainer.axis         = .vertical
        emailContainer.spacing      = 4
        // Button
        view.addSubview(saveButton)
                
        // Constraints
        NSLayoutConstraint.activate([
            userImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            userImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userImage.heightAnchor.constraint(equalToConstant: 128),
            userImage.widthAnchor.constraint(equalToConstant: 128),
            
            fullNameTextField.heightAnchor.constraint(equalToConstant: 48),
            phoneNumberTextField.heightAnchor.constraint(equalToConstant: 48),
            emailTextField.heightAnchor.constraint(equalToConstant: 48),

            stackView.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: 64),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            saveButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            saveButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationController()
    }
    
    // MARK: - Functions
    private func configureNavigationController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = false
        
        navigationController?.navigationBar.tintColor = Colors.mainColor
    }
}
