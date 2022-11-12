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
    let email                   = GFTextField(placeholder: "Email")
    let password                = GFTextField(placeholder: "Password")
    let textFieldsStack         = UIStackView()
    let forgetPassword          = GFSimpleButton(title: "Forget password?", titleColor: .label)
    let loginbutton             = TransitionButton(frame: .zero)
    let loginWithLabel          = GFTitleLabel(textAlignment: .center, fontSize: 16, weight: .bold)
    let facebookButton          = GFMediaButton(backgroundColor: .blue, image: Images.facebook!)
    let googleButton            = GFMediaButton(backgroundColor: .red, image: Images.google!)
    let mediaLoginStack         = UIStackView()
    let newGuestLabel           = GFTitleLabel(textAlignment: .left, fontSize: 16, weight: .semibold)
    let signUpButton            = GFSimpleButton(title: "sgin up", titleColor: Colors.mainColor!)
    let sginUpStackView         = UIStackView()
    
    var isExpend: Bool              = false
    let padding: CGFloat            = 20
    var itemViews: [UIView]         = []
    var textFiledInStack: [UIView]  = []
    var presenter: LoginPresenter!
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor    = .systemBackground
        presenter               = LoginPresenter(view: self)        
        configureUI()
        configureActionButtons()
        handelViewWhileUsingKeyboard()
        facebookButton.imageEdgeInsets = UIEdgeInsets(top: 10, left: 4, bottom: 0, right: 4)
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
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
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardApper), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDisApper), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardApper() {
        if !isExpend {
            self.scrollView.contentSize = CGSize(width: self.view.frame.width, height: self.scrollView.frame.height + 340)
            isExpend = true
        }
    }
    
    @objc func keyboardDisApper() {
        if isExpend {
            self.scrollView.contentSize = CGSize(width: self.view.frame.width, height: self.scrollView.frame.height - 340)
            self.isExpend = false
        }
    }
    // Cehcl if textfiled is empty
    func isTextFieldsIsEmpty() -> loginParms {
        guard let phoneNumber = email.text, !phoneNumber.isEmpty else {
             presentGFAlert(title: "Woops", message: "Phone Number is empty, please enter your phone. 😅", buttonTitle: "OK")
            loginbutton.handelButtonAfterStopAnimation()
            return loginParms.init(phone: "", password: "")
        }
        guard let password = password.text, !password.isEmpty else {
             presentGFAlert(title: "Woops", message: "\(password.placeholder ?? "") is empty, please enter your password. 😅", buttonTitle: "OK")
            loginbutton.handelButtonAfterStopAnimation()
            return loginParms.init(phone: "", password: "")
        }
        return loginParms.init(phone: phoneNumber, password: password)
    }
    // Action buttons
    @objc func forgetPasswordClicked() {}
    @objc func loginButtonClicked() {
        let model = isTextFieldsIsEmpty()
        let parms = [
            "phoneNumber" : model.phone,
            "password" : model.password
        ]
        presenter.login(parms: parms)
    }
    @objc func signUpButtonClicked() { presenter.signUp() }
    @objc func googleButtonCliced() { presenter.loginWithGoogle(controller: self)}
    @objc func facebookButtonClicked() { presenter.loginWithFacebook(controller: self)}
}
