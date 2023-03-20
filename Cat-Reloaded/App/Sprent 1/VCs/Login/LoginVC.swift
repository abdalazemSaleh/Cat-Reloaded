//
//  LoginVC.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-10-05.
//

import UIKit
import TransitionButton

class LoginVC: UIViewController {

    // MARK: - Variables
    var scrollView: UIScrollView!
    var contentView: UIView!
    let logo                    = GFImageView(frame: .zero)
    let loginLabel              = GFTitleLabel(textAlignment: .left, fontSize: 24, weight: .bold)
    let phone                   = GFTextField(placeholder: "Phone number")
    let phoneError              = GFErrorLabel(text: "Check your phone number.")
    let phoneContainer          = UIStackView()
    let password                = GFTextField(SecurePlaceholder: "Password")
    let passwordError           = GFErrorLabel(text: "Check you password")
    let passwordContainer       = UIStackView()
    let textFieldsStack         = UIStackView()
    let forgetPassword          = GFSimpleButton(title: "Forget password?", titleColor: .label)
    let loginbutton             = TransitionButton(frame: .zero)
    let loginWithLabel          = GFTitleLabel(textAlignment: .center, fontSize: 16, weight: .bold)
    let facebookButton          = GFMediaButton(backgroundColor: .clear, image: Images.facebook!)
    let googleButton            = GFMediaButton(backgroundColor: .clear, image: Images.google!)
    let mediaLoginStack         = UIStackView()
    let newGuestLabel           = GFTitleLabel(textAlignment: .left, fontSize: 16, weight: .semibold)
    let signUpButton            = GFSimpleButton(title: "sgin up", titleColor: Colors.mainColor!)
    let sginUpStackView         = UIStackView()
    
    var isExpend: Bool              = false
    let padding: CGFloat            = 16
    var presenter: LoginPresenter!
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor    = .systemBackground
        presenter               = LoginPresenter(view: self)
        phone.keyboardType      = .decimalPad
        configureUI()
        configureActionButtons()
        handelViewWhileUsingKeyboard()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
        phoneError.isHidden     = true
        passwordError.isHidden  = true
    }
            
    // MARK: - Functions
    // Configure Action Button
    func configureActionButtons() {
        loginbutton.addTarget(self, action: #selector(loginButtonClicked), for: .touchUpInside)
        forgetPassword.addTarget(self, action: #selector(forgetPasswordClicked), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(signUpButtonClicked), for: .touchUpInside)
        googleButton.addTarget(self, action: #selector(googleButtonCliced), for: .touchUpInside)
        facebookButton.addTarget(self, action: #selector(facebookButtonClicked), for: .touchUpInside)
    }

    // Handel view while using keyboard
    func handelViewWhileUsingKeyboard() {
        initializeHideKeyboard()
        subscribeToNotification(UIResponder.keyboardWillShowNotification, selector: #selector(keyboardWillShowOrHide))
        subscribeToNotification(UIResponder.keyboardWillHideNotification, selector: #selector(keyboardWillShowOrHide))
    }
    #warning("Need to refactor this method")
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
    
    // Cehck if textfiled is empty
    func isTextFieldsIsEmpty() -> loginParms {
        guard let phoneNumber = phone.text, !phoneNumber.isEmpty else {
            phoneError.isHidden = false
            return loginParms.init(phone: "", password: "")
        }
        guard let password = password.text, !password.isEmpty else {
            phoneError.isHidden = true
            passwordError.isHidden = false
            return loginParms.init(phone: "", password: "")
        }
        return loginParms.init(phone: phoneNumber, password: password)
    }
    // Action buttons
    @objc func forgetPasswordClicked() { }
    @objc func loginButtonClicked() {
        let model = isTextFieldsIsEmpty()
        guard !model.phone.isEmpty, !model.password.isEmpty else { return }
        passwordError.isHidden = true
        let parms = [
            "phoneNumber" : model.phone,
            "password" : model.password
        ]
        presenter.login(parms: parms)
    }
    @objc func signUpButtonClicked() { presenter.signUp() }
    @objc func googleButtonCliced() { presenter.loginWithGoogle(controller: self) }
    @objc func facebookButtonClicked() { presenter.loginWithFacebook(controller: self) }
}
