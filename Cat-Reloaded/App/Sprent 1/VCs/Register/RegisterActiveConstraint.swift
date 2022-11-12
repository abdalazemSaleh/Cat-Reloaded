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
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    // Configure content view
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

        NSLayoutConstraint.activate([
            logo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 80),
            logo.widthAnchor.constraint(equalToConstant: logoWidth),
            logo.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logo.heightAnchor.constraint(equalToConstant: 80)
        ])
    }

    // Configure login label
    func configureSginUpLabel() {
        signUpLabel.text = "Sign up"
        signUpLabel.textColor = Colors.mainColor

        NSLayoutConstraint.activate([
            signUpLabel.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 80),
            signUpLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding)
        ])
    }
    
    // Configure text field stack
    func configureTextFieldsStack() {
        textFieldsStack.axis            = .vertical
        textFieldsStack.spacing         = padding
        
        textFiledInStack = [fullName, email, phoneNumber, password, conformPassword ]
        
        for textField in textFiledInStack {
            NSLayoutConstraint.activate([
                textField.heightAnchor.constraint(equalToConstant: 48)
            ])
            textFieldsStack.addArrangedSubview(textField)
        }
        
        textFieldsStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textFieldsStack.topAnchor.constraint(equalTo: signUpLabel.bottomAnchor, constant: padding),
            textFieldsStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            textFieldsStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding)
        ])
    }
    
    // Configure sgin up button
    func configureSginUpButton() {
        signUpButton.customTransactionButton(title: "Sign up")
        
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: textFieldsStack.bottomAnchor, constant: 40),
            signUpButton.heightAnchor.constraint(equalToConstant: 48),
            ])
    }
    
    // Configure login button
    func configureLoginButton() {
        loginStack.axis         = .horizontal
        loginStack.distribution = .equalSpacing
        loginStack.spacing      = 4
        familiarCAtian.text     = "Familiar CAtian"
        
        loginStack.addArrangedSubview(familiarCAtian)
        loginStack.addArrangedSubview(login)

        loginStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            loginStack.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: padding),
            loginStack.centerXAnchor.constraint(equalTo: signUpButton.centerXAnchor),
            loginStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding)
        ])
    }

    /// Shared comstraint
    func sharedConstraint() {
        itemViews = [textFieldsStack, signUpButton]

        for itemView in itemViews {
            NSLayoutConstraint.activate([
                itemView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
                itemView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            ])
        }
    }

}
