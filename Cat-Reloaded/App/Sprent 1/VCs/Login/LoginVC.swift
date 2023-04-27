//
//  LoginVC.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-10-05.
//

import UIKit
import Alamofire

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
    let loginbutton             = GFLoaderButton(buttonTitle: "Login", buttonBackgroundColor: Colors.mainColor!)
    
    let loginWithLabel          = GFTitleLabel(textAlignment: .center, fontSize: 16, weight: .bold)
    let facebookButton          = GFMediaButton(backgroundColor: .clear, image: Images.facebook!)
    let googleButton            = GFMediaButton(backgroundColor: .clear, image: Images.google!)
    let mediaLoginStack         = UIStackView()
    let newGuestLabel           = GFTitleLabel(textAlignment: .left, fontSize: 16, weight: .semibold)
    let signUpButton            = GFSimpleButton(title: "Sign up", titleColor: Colors.mainColor!)
    let sginUpStackView         = UIStackView()
    
    var isExpend: Bool              = false
    var isLoding: Bool              = false
    let padding: CGFloat            = 16
    var presenter: LoginPresenter!
    
    var loginButtonConstraint: [NSLayoutConstraint] = []
    
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
        loginbutton.addTarget(presenter, action: #selector(presenter.loginButtonClicked), for: .touchUpInside)
        forgetPassword.addTarget(presenter, action: #selector(presenter.forgetPasswordClicked), for: .touchUpInside)
        signUpButton.addTarget(presenter, action: #selector(presenter.signUpButtonClicked), for: .touchUpInside)
        googleButton.addTarget(self, action: #selector(googleButtonClicked), for: .touchUpInside)
        facebookButton.addTarget(presenter, action: #selector(presenter.facebookButtonClicked(controller:)), for: .touchUpInside)
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
    
    @objc func googleButtonClicked() {
        presenter.loginWithGoogle(controller: self)
    }
}
