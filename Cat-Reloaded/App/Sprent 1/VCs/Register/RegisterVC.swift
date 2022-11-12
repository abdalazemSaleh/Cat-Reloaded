//
//  RegisterVC.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-10-07.
//

import UIKit
import TransitionButton

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
    let email                       = GFTextField(placeholder: "Email")
    let phoneNumber                 = GFTextField(placeholder: "Phone numbner")
    let password                    = GFTextField(placeholder: "Password")
    let conformPassword             = GFTextField(placeholder: "Conform password")
    var textFiledInStack: [UIView]  = []
    let textFieldsStack             = UIStackView()
    /// Buttons
    let signUpButton                = TransitionButton(frame: .zero)
    let familiarCAtian              = GFTitleLabel(textAlignment: .left, fontSize: 16, weight: .semibold)
    let login                       = GFSimpleButton(title: "Login", titleColor: Colors.mainColor!)
    let loginStack                  = UIStackView()
    /// Picker view
    var universtyPicker             = UIPickerView()
    var facultyPicker               = UIPickerView()
    var techFiledPicker             = UIPickerView()
    var pickersView: [UIPickerView] = []
    var universityArr: [String]     = []
    var facultyArr: [String]        = []
    var techFiledArr: [String]      = []
    
    let toolBar = UIToolbar()
    
    /// others
    var isExpend: Bool              = false
    let padding: CGFloat            = 20
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
                presentGFAlert(title: "Woops", message: "\(textField.placeholder ?? "") is empty, please enter your \(textField.placeholder ?? "")", buttonTitle: "OK")
                return nil
            }
            parms.append(text)
        }
        return signUpParms(fullName: parms[0], email: parms[1], phonNumber: parms[2], password: parms[3], passwordConfirmation: parms[4])
    }
    
    // Action buttons
    @objc func signUpButtonClicked() {
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

