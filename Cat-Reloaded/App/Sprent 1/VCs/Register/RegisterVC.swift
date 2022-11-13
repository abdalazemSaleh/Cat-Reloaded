//
//  RegisterVC.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-10-07.
//

import UIKit
import TransitionButton

enum errorLabels {
    case name, email, phone, password
}

class RegisterVC: UIViewController {
    
    // MARK: - Variables
    /// Scroll view
    var scrollView: UIScrollView!
    var contentView: UIView!
    /// Logo & label
    let logo                        = GFImageView(frame: .zero)
    let signUpLabel                 = GFTitleLabel(textAlignment: .left, fontSize: 24, weight: .bold)
    /// Text fields
    let fullName                    = GFTextField(placeholder: "Full name")
    let fullNameError               = GFErrorLabel(text: " Check your name.")
    let fullNameContainer           = UIStackView()
    let email                       = GFTextField(placeholder: "Email")
    let emailErorr                  = GFErrorLabel(text: " Check your email.")
    let emailContainer              = UIStackView()
    let phoneNumber                 = GFTextField(placeholder: "Phone numbner")
    let phoneNumberErorr            = GFErrorLabel(text: " Check your phone.")
    let phoneContainer              = UIStackView()
    let password                    = GFTextField(placeholder: "Password")
    let passwordErorr               = GFErrorLabel(text: " Password is weak.")
    let passwordContainer           = UIStackView()
    let conformPassword             = GFTextField(placeholder: "Conform password")
    let passwordConfirmErorr        = GFErrorLabel(text: " Not match")
    let passwordConfirmContainer    = UIStackView()
    let textFieldsStack             = UIStackView()
    /// Buttons
    let signUpButton                = TransitionButton(frame: .zero)
    let familiarCAtian              = GFTitleLabel(textAlignment: .left, fontSize: 16, weight: .semibold)
    let login                       = GFSimpleButton(title: "Login", titleColor: Colors.mainColor!)
    let loginStack                  = UIStackView()
        
    /// others
    var containers: [UIStackView]   = []
    var errorLabels: [UILabel]      = []
    var isExpend: Bool              = false
    let padding: CGFloat            = 16
    var itemViews: [UIView]         = []
    var presenter: RegisterPresenter!
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor    = .systemBackground
        presenter               = RegisterPresenter(view: self)
        configureUI()
        configureActionButtons()
        handelViewWhileUsingKeyboard()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
        // handel error label
        errorLabels = [fullNameError, emailErorr, phoneNumberErorr, passwordErorr, passwordConfirmErorr]
        for errorLabel in errorLabels {
            errorLabel.isHidden = true
        }
    }
    
    // MARK: - Functions
    // Configure Action Button
    func configureActionButtons() {
        signUpButton.addTarget(self, action: #selector(signUpButtonClicked), for: .touchUpInside)
        login.addTarget(self, action: #selector(loginButtonClicked), for: .touchUpInside)
    }
    
    // Handel view while using keyboard
    func handelViewWhileUsingKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardApper), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDisApper), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardApper() {
        if !isExpend {
            self.scrollView.contentSize = CGSize(width: self.view.frame.width, height: self.scrollView.frame.height + 640)
            isExpend = true
        }
    }
    
    @objc func keyboardDisApper() {
        if isExpend {
            self.scrollView.contentSize = CGSize(width: self.view.frame.width, height: self.scrollView.frame.height - 640)
            self.isExpend = false
        }
    }
    
    // Cehcl if textfiled is empty
    func isTextFieldsIsEmpty() -> signUpParms? {
        let textFields: [UITextField] = [fullName, email, phoneNumber, password, conformPassword]
        var parms: [String] = []
        for textField in textFields {
            let text: String = textField.text ?? ""
            print(text)
            guard !text.isEmpty else {
                // TODO: - Handel error label
                if textField == fullName { handelErrorLable(textField: .name) }
                else if textField == email { handelErrorLable(textField: .email) }
                else if textField == phoneNumber { handelErrorLable(textField: .phone) }
                else if textField == password { handelErrorLable(textField: .password) }
                return nil
            }
            parms.append(text)
        }
        guard password.text == conformPassword.text else {
            passwordErorr.isHidden          = true
            passwordConfirmErorr.isHidden   = false
            return nil
        }
        return signUpParms(fullName: parms[0], email: parms[1], phonNumber: parms[2], password: parms[3], passwordConfirmation: parms[4])
    }
    
    func handelErrorLable(textField: errorLabels) {
        switch textField {
        case .name:
            fullNameError.isHidden      = false
        case .email:
            fullNameError.isHidden      = true
            emailErorr.isHidden         = false
        case .phone:
            emailErorr.isHidden         = true
            phoneNumberErorr.isHidden   = false
        case .password:
            phoneNumberErorr.isHidden   = true
            passwordErorr.isHidden      = false
        }
    }
    
    // Action buttons
    @objc func signUpButtonClicked() {
        passwordConfirmErorr.isHidden = true
        guard let model = isTextFieldsIsEmpty() else { return }
        let parms: [String : Any] = [
            "fullName" : model.fullName,
            "email" : model.email,
            "phoneNumber" : model.phonNumber,
            "password" : model.password
        ]
        presenter.signUp(parms: parms)
    }
    
    @objc func loginButtonClicked() { presenter.login() }
}

