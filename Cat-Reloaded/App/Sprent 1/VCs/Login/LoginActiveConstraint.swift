//
//  LoginActiveConstraint.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-10-06.
//

import UIKit

#warning("Try to refactor this code")

extension LoginVC {
    /// Configure UI
    func configureUI() {
        configureScrollView()
        configureContentView()
        addItemViewToContentView()
        configureLogo()
        configureLoginLabel()
        configureTextFieldsStack()
        configureForgetPassword()
        configureLoginButton()
        configureLoginWithMediaAccount()
        ConfigureSginUpButton()
        sharedConstraint()
    }
    
    /// Configure Scroll View
    func configureScrollView() {
        
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
    
    /// Add items to content view
    func addItemViewToContentView() {
        itemViews   = [logo, loginLabel, textFieldsStack, forgetPassword, loginbutton, sginUpStackView, loginWithLabel, mediaLoginStack]
        for itemView in itemViews {
            contentView.addSubview(itemView)
        }
    }
    
    /// Configure logo
    func configureLogo() {
        logo.image      = UIImage(named: "logo")
        let logoWidth   = view.frame.width / 2

        NSLayoutConstraint.activate([
            logo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 80),
            logo.widthAnchor.constraint(equalToConstant: logoWidth),
            logo.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logo.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    /// Configure login label
    func configureLoginLabel() {
        loginLabel.text = "Login"
        loginLabel.textColor = Colors.mainColor
        
        NSLayoutConstraint.activate([
            loginLabel.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 80),
            loginLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding)
        ])
    }
    
    /// configure text fields stack
    func configureTextFieldsStack(){
        textFieldsStack.axis            = .vertical
        textFieldsStack.spacing         = padding
        
        textFiledInStack = [email, password]
        
        for textField in textFiledInStack {
            NSLayoutConstraint.activate([
                textField.heightAnchor.constraint(equalToConstant: 48)
            ])
            textFieldsStack.addArrangedSubview(textField)
        }
        
        textFieldsStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textFieldsStack.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: padding),
            textFieldsStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            textFieldsStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding)
        ])
    }
    
    /// Configure forget password
    func configureForgetPassword() {
        NSLayoutConstraint.activate([
            forgetPassword.topAnchor.constraint(equalTo: textFieldsStack.bottomAnchor, constant: padding),
            forgetPassword.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
        ])
    }
    
    /// Configure login button
    func configureLoginButton() {
        loginbutton.customTransactionButton(title: "Login")
        
        NSLayoutConstraint.activate([
            loginbutton.topAnchor.constraint(equalTo: forgetPassword.bottomAnchor, constant: 40),
            loginbutton.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
    
    /// Configure login with media account
    func configureLoginWithMediaAccount() {
        loginWithLabel.text             = "or login with"
        
        mediaLoginStack.axis            = .horizontal
        mediaLoginStack.distribution    = .equalSpacing
        mediaLoginStack.spacing         = 24
        
        mediaLoginStack.addArrangedSubview(facebookButton)
        mediaLoginStack.addArrangedSubview(googleButton)
        
        mediaLoginStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            facebookButton.heightAnchor.constraint(equalToConstant: 48),
            facebookButton.widthAnchor.constraint(equalToConstant: 48),
            
            googleButton.heightAnchor.constraint(equalToConstant: 48),
            googleButton.widthAnchor.constraint(equalToConstant: 48),

            
            loginWithLabel.topAnchor.constraint(equalTo: loginbutton.bottomAnchor, constant: 40),
            loginWithLabel.centerXAnchor.constraint(equalTo: loginbutton.centerXAnchor),
            
            mediaLoginStack.topAnchor.constraint(equalTo: loginWithLabel.bottomAnchor, constant: padding),
            mediaLoginStack.centerXAnchor.constraint(equalTo: loginWithLabel.centerXAnchor)
        ])
    }
    
    /// Configure sgin up butotn
    func ConfigureSginUpButton() {
        sginUpStackView.axis            = .horizontal
        sginUpStackView.distribution    = .equalSpacing
        sginUpStackView.spacing         = 4
        newGuestLabel.text              = "New guest?"
        
        sginUpStackView.addArrangedSubview(newGuestLabel)
        sginUpStackView.addArrangedSubview(signUpButton)

        sginUpStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            sginUpStackView.topAnchor.constraint(equalTo: mediaLoginStack.bottomAnchor, constant: padding),
            sginUpStackView.centerXAnchor.constraint(equalTo: mediaLoginStack.centerXAnchor),
            sginUpStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding)
        ])
    }
        
    /// Shared comstraint
    func sharedConstraint() {
        itemViews       = [textFieldsStack, loginbutton]
        
        for itemView in itemViews {
            NSLayoutConstraint.activate([
                itemView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
                itemView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            ])
        }
    }
}

