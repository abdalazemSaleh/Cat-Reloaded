//
//  ProfileVC+Constraints.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2023-03-28.
//

import UIKit

extension ProfileVC {
    
    func configureUI() {
        configureScrollView()
        configureContentView()
        addSubViews()
        configureUserImage()
        configureStackView()
        configureSaveButton()
    }
    
    private func configureScrollView() {
        scrollView = UIScrollView(frame: .zero)
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    /// Configure content view
    func configureContentView() {
        contentView = UIView(frame: .zero)
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        let heightConstraint = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        heightConstraint.priority = UILayoutPriority(250)
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            heightConstraint,
        ])
    }
    
    private func addSubViews() {
        views = [userImage, stackView, saveButton]
        for view in views {
            contentView.addSubview(view)
        }
    }
    
    private func configureUserImage() {
        
        userImage.image = UIImage(named: "abd")
        userImage.layer.borderWidth = 2
        userImage.layer.borderColor = UIColor.label.cgColor
        userImage.layer.cornerRadius = 128/2
        userImage.clipsToBounds = true
        
        customConstraint.append(userImage.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 32))
        customConstraint.append(userImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor))
        customConstraint.append(userImage.heightAnchor.constraint(equalToConstant: 128))
        customConstraint.append(userImage.widthAnchor.constraint(equalToConstant: 128))
        
        NSLayoutConstraint.activate(customConstraint)
    }
    
    private func configureStackView() {

        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let stackViews: [UIStackView] = [fullNameContainer, phoneNumberContainer, emailContainer]
        for view in stackViews {
            stackView.addArrangedSubview(view)
            view.axis       = .vertical
            view.spacing    = 4
        }
                
        stackView.axis = .vertical
        stackView.spacing = 16
        
        fullNameLabel.text = " Full Name"
        fullNameTextField.text = UserData.getUserModel()?.fullName
        fullNameContainer.addArrangedSubview(fullNameLabel)
        fullNameContainer.addArrangedSubview(fullNameTextField)
                
        phoneNumberLabel.text = " Phone Number"
        phoneNumberTextField.text = UserData.getUserModel()?.phoneNumber
        phoneNumberContainer.addArrangedSubview(phoneNumberLabel)
        phoneNumberContainer.addArrangedSubview(phoneNumberTextField)
        
        emailLabel.text = " Email"
        emailTextField.text = UserData.getUserModel()?.email
        emailContainer.addArrangedSubview(emailLabel)
        emailContainer.addArrangedSubview(emailTextField)
        
        let textFields: [UITextField] = [fullNameTextField, phoneNumberTextField, emailTextField]
        for textField in textFields {
            customConstraint.append(textField.heightAnchor.constraint(equalToConstant: 48))
        }

        customConstraint.append(stackView.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: 64))
        customConstraint.append(stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20))
        customConstraint.append(stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20))

        NSLayoutConstraint.activate(customConstraint)
    }
    
    private func configureSaveButton() {

        handelSaveButtonConstraint(isLogin: isLoding)
        
        saveButton.addTarget(self, action: #selector(save), for: .touchUpInside)
        NSLayoutConstraint.activate(saveButtonConstraint)
    }
    
    @objc func save() {
        handelButtonStyle()
        guard let fullName = fullNameTextField.text,
              let email = emailTextField.text, emailTextField.isValidEmail(),
              let phoneNumber = phoneNumberTextField.text, phoneNumberTextField.isValidPhoneNumber()
        else {
            presentGFAlert(title: "Woops.", message: "Maybe your data is missing please check your data.", buttonTitle: "OK")
            handelButtonStyle()
            return
        }
        let parms = [
            "fullName": fullName,
            "email" : email,
            "phoneNumber": phoneNumber
        ]
        presenter.updateUserProfile(parms: parms)
    }
    
    func handelButtonStyle() {
        NSLayoutConstraint.deactivate(saveButtonConstraint)
        saveButtonConstraint.removeAll()
        isLoding.toggle()
        saveButton.isLoading.toggle()
        handelSaveButtonConstraint(isLogin: isLoding)
        
        UIView.animate(withDuration: 0.3) {
            self.saveButton.layoutIfNeeded()
        } completion: { _ in
            if self.saveButton.isLoading {
                self.saveButton.startLoadingAnimation()
            } else {
                self.saveButton.spiner.removeFromSuperview()
            }
        }
    }
    
    private func handelSaveButtonConstraint(isLogin: Bool) {
        if isLoding {
            saveButtonConstraint.append(saveButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 64))
            saveButtonConstraint.append(saveButton.heightAnchor.constraint(equalToConstant: 52))
            saveButtonConstraint.append(saveButton.widthAnchor.constraint(equalToConstant: 52))
            saveButtonConstraint.append(saveButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor))
            saveButtonConstraint.append(saveButton.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -32))
            NSLayoutConstraint.activate(saveButtonConstraint)
        } else {
            saveButtonConstraint.append(saveButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 64))
            saveButtonConstraint.append(saveButton.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -32))
            saveButtonConstraint.append(saveButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20))
            saveButtonConstraint.append(saveButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20))
            saveButtonConstraint.append(saveButton.heightAnchor.constraint(equalToConstant: 48))
            NSLayoutConstraint.activate(saveButtonConstraint)
        }
    }
}
