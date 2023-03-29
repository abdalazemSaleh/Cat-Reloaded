//
//  ProfileVC.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2023-02-11.
//

import UIKit

class ProfileVC: UIViewController {
    // MARK: - Variables
    // Scroll View
    var scrollView: UIScrollView!
    var contentView: UIView!
    /// User image
    let userImage = GFImageView(frame: .zero)
    /// Text fields
    let fullNameLabel           = GFTitleLabel(textAlignment: .left, fontSize: 16, weight: .bold)
    let fullNameTextField       = GFTextField(placeholder: "Full name")
    let fullNameContainer       = UIStackView()
    
    let phoneNumberLabel        = GFTitleLabel(textAlignment: .left, fontSize: 16, weight: .bold)
    let phoneNumberTextField    = GFTextField(placeholder: "Phone number")
    let phoneNumberContainer    = UIStackView()
    
    let emailLabel              = GFTitleLabel(textAlignment: .left, fontSize: 16, weight: .bold)
    let emailTextField          = GFTextField(placeholder: "Email")
    let emailContainer          = UIStackView()
    
    let stackView               = UIStackView()
    /// Buttons
    let saveButton              = GFLoaderButton(buttonTitle: "Save", buttonBackgroundColor: Colors.mainColor ?? .systemRed)
    var isLoding: Bool           = false
    
    // Variables
    var views: [UIView] = []
    var customConstraint: [NSLayoutConstraint] = []
    var saveButtonConstraint: [NSLayoutConstraint] = []


    var presenter: ProfilePresenter!
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = ProfilePresenter(view: self)
        configureUI()
        handelViewWhileUsingKeyboard()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationController()
    }
    
    // MARK: - Functions
    private func configureNavigationController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = false
        
        navigationController?.navigationBar.tintColor = Colors.mainColor
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

}
