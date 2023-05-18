//
//  LoginActiveConstraint.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-10-06.
//

import UIKit

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
        
        scrollView.makeConstraints(topAnchor: view.safeAreaLayoutGuide.topAnchor,
                                   bottomAnchor: view.safeAreaLayoutGuide.bottomAnchor,
                                   leadingAnchor: view.leadingAnchor,
                                   trailingAnchor: view.trailingAnchor)
    }

    /// Configure content view
    func configureContentView() {
        contentView = UIView(frame: .zero)
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
    
        let heightConstraint = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        heightConstraint.priority = UILayoutPriority(250)
        heightConstraint.isActive = true
        
        contentView.makeConstraints(topAnchor: scrollView.topAnchor,
                                    bottomAnchor: scrollView.bottomAnchor,
                                    leadingAnchor: scrollView.leadingAnchor,
                                    setWidthAnchor: scrollView.widthAnchor)
        
    }
    
    /// Add items to content view
    func addItemViewToContentView() {
        let itemViews: [UIView] = [logo, loginLabel, textFieldsStack, forgetPassword, loginbutton, sginUpStackView, loginWithLabel, mediaLoginStack]
        for itemView in itemViews {
            contentView.addSubview(itemView)
        }
    }
    
    /// Configure logo
    func configureLogo() {
        logo.image      = UIImage(named: "logo")
        let logoWidth   = view.frame.width / 2

        let padding = UIEdgeInsets(top: 80, left: 0, bottom: 0, right: 0)
        
        logo.makeConstraints(topAnchor: contentView.topAnchor,
                             centerXAnchor: contentView.centerXAnchor,
                             padding: padding,
                             size: CGSize(width: logoWidth, height: 80))
    }
    
    /// Configure login label
    func configureLoginLabel() {
        loginLabel.text = "Login"
        loginLabel.textColor = Colors.mainColor
        
        let padding = UIEdgeInsets(top: 80, left: padding, bottom: 0, right: 0)
        
        loginLabel.makeConstraints(topAnchor: logo.bottomAnchor,
                                   leadingAnchor: contentView.leadingAnchor,
                                   padding: padding)
    }
    
    func configureContainers() {
        phoneContainer.axis         = .vertical
        phoneContainer.spacing      = 4
        
        passwordContainer.axis      = .vertical
        passwordContainer.spacing   = 4
                
        phone.makeConstraints(size: CGSize(width: 0, height: 48))
        password.makeConstraints(size: CGSize(width: 0, height: 48))
        
        phoneContainer.addArrangedSubview(phone)
        phoneContainer.addArrangedSubview(phoneError)
        
        passwordContainer.addArrangedSubview(password)
        passwordContainer.addArrangedSubview(passwordError)
    }
    
    /// configure text fields stack
    func configureTextFieldsStack(){
        configureContainers()
        textFieldsStack.axis            = .vertical
        textFieldsStack.spacing         = padding
                
        textFieldsStack.addArrangedSubview(phoneContainer)
        textFieldsStack.addArrangedSubview(passwordContainer)
        
        textFieldsStack.translatesAutoresizingMaskIntoConstraints = false
        
        let padding = UIEdgeInsets(top: padding, left: padding, bottom: 0, right: padding)
        textFieldsStack.makeConstraints(topAnchor: loginLabel.bottomAnchor,
                                        leadingAnchor: contentView.leadingAnchor,
                                        trailingAnchor: contentView.trailingAnchor,
                                        padding: padding)
    }
    
    /// Configure forget password
    func configureForgetPassword() {
        let padding = UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 16)
        
        forgetPassword.makeConstraints(topAnchor: textFieldsStack.bottomAnchor,
                                       trailingAnchor: contentView.trailingAnchor,
                                       padding: padding)
    }
    
    /// Configure login button
    func configureLoginButton() {
        handelSaveButtonConstraint(isLogin: isLoding)
        NSLayoutConstraint.activate(loginButtonConstraint)
    }
    
    func handelButtonStyle() {
        NSLayoutConstraint.deactivate(loginButtonConstraint)
        loginButtonConstraint.removeAll()
        isLoding.toggle()
        loginbutton.isLoading.toggle()
        handelSaveButtonConstraint(isLogin: isLoding)
        
        UIView.animate(withDuration: 0.3) {
            self.loginbutton.layoutIfNeeded()
        } completion: { _ in
            if self.loginbutton.isLoading {
                self.loginbutton.startLoadingAnimation()
            } else {
                self.loginbutton.spiner.removeFromSuperview()
            }
        }
    }
    
    private func handelSaveButtonConstraint(isLogin: Bool) {
        if isLoding {
            loginButtonConstraint.append(loginbutton.topAnchor.constraint(equalTo: forgetPassword.bottomAnchor, constant: 40))
            loginButtonConstraint.append(loginbutton.heightAnchor.constraint(equalToConstant: 48))
            loginButtonConstraint.append(loginbutton.widthAnchor.constraint(equalToConstant: 48))
            loginButtonConstraint.append(loginbutton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor))
            NSLayoutConstraint.activate(loginButtonConstraint)
        } else {
            loginButtonConstraint.append(loginbutton.topAnchor.constraint(equalTo: forgetPassword.bottomAnchor, constant: 40))
            loginButtonConstraint.append(loginbutton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20))
            loginButtonConstraint.append(loginbutton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20))
            loginButtonConstraint.append(loginbutton.heightAnchor.constraint(equalToConstant: 48))
            NSLayoutConstraint.activate(loginButtonConstraint)
        }
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
        
        facebookButton.makeConstraints(size: CGSize(width: 48, height: 48))
        googleButton.makeConstraints(size: CGSize(width: 48, height: 48))
        
        let loginWithLabelPadding = UIEdgeInsets(top: 40, left: 0, bottom: 0, right: 0)
        loginWithLabel.makeConstraints(topAnchor: loginbutton.bottomAnchor,
                                       centerXAnchor: loginbutton.centerXAnchor,
                                       padding: loginWithLabelPadding)
        
        let mediaLoginStackPadding = UIEdgeInsets(top: padding, left: 0, bottom: 0, right: 0)
        mediaLoginStack.makeConstraints(topAnchor: loginWithLabel.bottomAnchor,
                                        centerXAnchor: loginWithLabel.centerXAnchor,
                                        padding: mediaLoginStackPadding)
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
        
        let sginUpStackViewPadding = UIEdgeInsets(top: padding, left: 0, bottom: padding, right: 0)
        sginUpStackView.makeConstraints(topAnchor: mediaLoginStack.bottomAnchor,
                                        bottomAnchor: contentView.bottomAnchor,
                                        centerXAnchor: mediaLoginStack.centerXAnchor,
                                        padding: sginUpStackViewPadding)
    }
        
    /// Shared comstraint
    func sharedConstraint() {
        let itemViews: [UIView]  = [textFieldsStack]
        
        for itemView in itemViews {
            let padding = UIEdgeInsets(top: 0, left: padding, bottom: 0, right: padding)
            itemView.makeConstraints(leadingAnchor: contentView.leadingAnchor,
                                     trailingAnchor: contentView.trailingAnchor,
                                     padding: padding)
        }
    }
}
