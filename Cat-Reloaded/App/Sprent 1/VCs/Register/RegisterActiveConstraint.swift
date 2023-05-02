//
//  RegisterActiveConstraint.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-10-07.
//

import UIKit

extension RegisterVC {
    
    // Configure UI
    func configureUI() {
        configureScrollView()
        configureContentView()
        addItemViewToContentView()
        configureLogo()
        configureSginUpLabel()
        configureTextFieldsStack()
        configureSginUpButton()
        configureLoginButton()
        sharedConstraint()
    }
    
    // Configure Scroll View
    func configureScrollView() {
        scrollView = UIScrollView(frame: .zero)
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.makeConstraints(topAnchor: view.safeAreaLayoutGuide.topAnchor,
                                   bottomAnchor: view.safeAreaLayoutGuide.bottomAnchor,
                                   leadingAnchor: view.leadingAnchor,
                                   trailingAnchor: view.trailingAnchor)
    }
    
    // Configure content view
    func configureContentView() {
        contentView = UIView(frame: .zero)
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        let heightConstraint = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        heightConstraint.priority = UILayoutPriority(250)
        heightConstraint.isActive = true
        
        contentView.makeConstraints(topAnchor: scrollView.topAnchor,
                                    bottomAnchor: scrollView.bottomAnchor,
                                    setWidthAnchor: scrollView.widthAnchor)
    }
    
    // Add items to content view
    func addItemViewToContentView() {
        itemViews   = [logo, signUpLabel, textFieldsStack, signUpButton, loginStack]
        for itemView in itemViews {
            contentView.addSubview(itemView)
        }
    }
    
    // Configure logo
    func configureLogo() {
        logo.image      = UIImage(named: "logo")
        let logoWidth   = view.frame.width / 2
        
        let logoPadding = UIEdgeInsets(top: 80, left: 0, bottom: 0, right: 0)
        
        logo.makeConstraints(topAnchor: contentView.topAnchor,
                             centerXAnchor: contentView.centerXAnchor,
                             padding: logoPadding,
                             size: CGSizeMake(logoWidth, 80))
    }
    
    // Configure login label
    func configureSginUpLabel() {
        signUpLabel.text = "Sign up"
        signUpLabel.textColor = Colors.mainColor
        
        let signUpLabelPadding = UIEdgeInsets(top: 80, left: padding, bottom: 0, right: padding)
        
        signUpLabel.makeConstraints(topAnchor: logo.bottomAnchor,
                                    leadingAnchor: contentView.leadingAnchor,
                                    trailingAnchor: contentView.trailingAnchor,
                                    padding: signUpLabelPadding)
    }
    // Configure Containers
    func configureContainers() {
        containers = [fullNameContainer, emailContainer, phoneContainer, passwordContainer, passwordConfirmContainer]
        for container in containers {
            container.axis      = .vertical
            container.spacing   = 4
        }
        let textFileds: [UITextField] = [fullName, email, phoneNumber, password, conformPassword ]
        
        for textFiled in textFileds {
            textFiled.makeConstraints(size: CGSizeMake(0, 48))
        }
        
        fullNameContainer.addArrangedSubview(fullName)
        fullNameContainer.addArrangedSubview(fullNameError)
        
        emailContainer.addArrangedSubview(email)
        emailContainer.addArrangedSubview(emailErorr)
        
        phoneContainer.addArrangedSubview(phoneNumber)
        phoneContainer.addArrangedSubview(phoneNumberErorr)
        
        passwordContainer.addArrangedSubview(password)
        passwordContainer.addArrangedSubview(passwordErorr)
        
        passwordConfirmContainer.addArrangedSubview(conformPassword)
        passwordConfirmContainer.addArrangedSubview(passwordConfirmErorr)
    }
    // Configure text field stack
    func configureTextFieldsStack() {
        configureContainers()
        textFieldsStack.axis            = .vertical
        textFieldsStack.spacing         = padding
        textFieldsStack.translatesAutoresizingMaskIntoConstraints = false
        
        for container in containers {
            textFieldsStack.addArrangedSubview(container)
        }
        
        let textFieldStackPadding = UIEdgeInsets(top: padding, left: padding, bottom: 0, right: padding)
        
        textFieldsStack.makeConstraints(topAnchor: signUpLabel.bottomAnchor,
                                        leadingAnchor: contentView.leadingAnchor,
                                        trailingAnchor: contentView.trailingAnchor,
                                        padding: textFieldStackPadding)
    }
    
    // Configure sgin up button
    func configureSginUpButton() {
        handelSaveButtonConstraint(isLogin: isLoding)
        NSLayoutConstraint.activate(signUpButtonConstraint)
    }
    
    
    func handelButtonStyle() {
        NSLayoutConstraint.deactivate(signUpButtonConstraint)
        signUpButtonConstraint.removeAll()
        isLoding.toggle()
        signUpButton.isLoading.toggle()
        handelSaveButtonConstraint(isLogin: isLoding)
        
        UIView.animate(withDuration: 0.3) {
            self.signUpButton.layoutIfNeeded()
        } completion: { _ in
            if self.signUpButton.isLoading {
                self.signUpButton.startLoadingAnimation()
            } else {
                self.signUpButton.spiner.removeFromSuperview()
            }
        }
    }
    
    private func handelSaveButtonConstraint(isLogin: Bool) {
        if isLoding {
            signUpButtonConstraint.append(signUpButton.topAnchor.constraint(equalTo: textFieldsStack.bottomAnchor, constant: 40))
            signUpButtonConstraint.append(signUpButton.heightAnchor.constraint(equalToConstant: 48))
            signUpButtonConstraint.append(signUpButton.widthAnchor.constraint(equalToConstant: 48))
            signUpButtonConstraint.append(signUpButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor))
            NSLayoutConstraint.activate(signUpButtonConstraint)
        } else {
            signUpButtonConstraint.append(signUpButton.topAnchor.constraint(equalTo: textFieldsStack.bottomAnchor, constant: 40))
            signUpButtonConstraint.append(signUpButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20))
            signUpButtonConstraint.append(signUpButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20))
            signUpButtonConstraint.append(signUpButton.heightAnchor.constraint(equalToConstant: 48))
            NSLayoutConstraint.activate(signUpButtonConstraint)
        }
    }
    
    
    // Configure login button
    func configureLoginButton() {
        loginStack.axis         = .horizontal
        loginStack.distribution = .equalSpacing
        loginStack.spacing      = 4
        familiarCAtian.text     = "Familiar CATian"
        
        loginStack.addArrangedSubview(familiarCAtian)
        loginStack.addArrangedSubview(login)
        
        loginStack.translatesAutoresizingMaskIntoConstraints = false
        
        let loginStackPadding = UIEdgeInsets(top: padding, left: 0, bottom: padding, right: 0)
        loginStack.makeConstraints(topAnchor: signUpButton.bottomAnchor,
                                   bottomAnchor: contentView.bottomAnchor,
                                   centerXAnchor: signUpButton.centerXAnchor,
                                   padding: loginStackPadding)
    }
    
    /// Shared comstraint
    func sharedConstraint() {
        itemViews = [textFieldsStack]
        
        let itemViewsPadding = UIEdgeInsets(top: 0, left: padding, bottom: 0, right: padding)
        
        for itemView in itemViews {
            itemView.makeConstraints(leadingAnchor: contentView.leadingAnchor,
                                     trailingAnchor: contentView.trailingAnchor,
                                     padding: itemViewsPadding)
        }
    }
}
