//
//  RegisterVC.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-10-07.
//

import UIKit

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
    let phoneNumber                 = GFTextField(placeholder: "Phone number")
    let phoneNumberErorr            = GFErrorLabel(text: " Check your phone.")
    let phoneContainer              = UIStackView()
    let password                    = GFTextField(SecurePlaceholder: "Password")
    let passwordErorr               = GFErrorLabel(text: " Password is weak.")
    let passwordContainer           = UIStackView()
    let conformPassword             = GFTextField(SecurePlaceholder: "Confirm password")
    let passwordConfirmErorr        = GFErrorLabel(text: " Not match")
    let passwordConfirmContainer    = UIStackView()
    let textFieldsStack             = UIStackView()
    /// Buttons
    let signUpButton                = GFLoaderButton(buttonTitle: "Sign up", buttonBackgroundColor: Colors.mainColor ?? .red)
    let familiarCAtian              = GFTitleLabel(textAlignment: .left, fontSize: 16, weight: .semibold)
    let login                       = GFSimpleButton(title: "Login", titleColor: Colors.mainColor!)
    let loginStack                  = UIStackView()
        
    /// others
    var containers: [UIStackView]   = []
    var errorLabels: [UILabel]      = []
    var isExpend: Bool              = false
    var isLoding: Bool             = false
    let padding: CGFloat            = 16
    var itemViews: [UIView]         = []
    var presenter: RegisterPresenter!
    
    var signUpButtonConstraint: [NSLayoutConstraint] = []
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor    = .systemBackground
        presenter               = RegisterPresenter(view: self)
        configureUI()
        setTextFieldsDelegate()
        configureActionButtons()
        handelViewWhileUsingKeyboard()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
        // handel error label
        makeAllErrorLabelsHidden()
    }
    func makeAllErrorLabelsHidden() {
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
        initializeHideKeyboard()
        subscribeToNotification(UIResponder.keyboardWillShowNotification, selector: #selector(keyboardWillShowOrHide))
        subscribeToNotification(UIResponder.keyboardWillHideNotification, selector: #selector(keyboardWillShowOrHide))
    }
    
    @objc func keyboardWillShowOrHide(notification: NSNotification) {
        if let scrollView = scrollView, let userInfo = notification.userInfo, let endValue = userInfo[UIResponder.keyboardFrameEndUserInfoKey], let durationValue = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey], let curveValue = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] {

            let endRect = view.convert((endValue as AnyObject).cgRectValue, from: view.window)

            let keyboardOverlap = scrollView.frame.maxY - endRect.origin.y

            scrollView.contentInset.bottom = keyboardOverlap

            let duration = (durationValue as AnyObject).doubleValue
            let options = UIView.AnimationOptions(rawValue: UInt((curveValue as AnyObject).integerValue << 16))
            UIView.animate(withDuration: duration!, delay: 0, options: options, animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
    }
    
    // Cehcl if textfiled is empty
    func isTextFieldsIsEmpty() -> signUpParms? {
        guard let text = fullName.text, !text.isEmpty else {
            handelErrorLable(textField: .name)
            return nil
        }
        guard email.isValidEmail() else {
            handelErrorLable(textField: .email)
            return nil
        }
        guard phoneNumber.isValidPhoneNumber() else {
            handelErrorLable(textField: .phone)
            return nil
        }
        guard password.isValidPassword() else {
            handelErrorLable(textField: .password)
            return nil
        }
        guard password.text == conformPassword.text else {
            passwordErorr.isHidden          = true
            passwordConfirmErorr.isHidden   = false
            return nil
        }
        return signUpParms(fullName: fullName.text!, email: email.text!, phonNumber: phoneNumber.text!, password: password.text!, passwordConfirmation: password.text!)
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
        makeAllErrorLabelsHidden()
        guard let model = isTextFieldsIsEmpty() else { return }
        let parms: [String : Any] = [
            "fullName" : model.fullName,
            "email" : model.email,
            "phoneNumber" : model.phonNumber,
            "password" : model.password
        ]
        Task {
            await presenter.signUp(parms: parms)
        }
    }
    
    @objc func loginButtonClicked() { presenter.login() }
}

