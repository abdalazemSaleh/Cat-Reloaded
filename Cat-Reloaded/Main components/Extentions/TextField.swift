//
//  TextField.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-10-05.
//

import UIKit

// MARK: - Handel text field spacer
extension UITextField {
    func handelTextFieldSpacer(){
        var textView: UIView {
            let view = UIView()
            view.backgroundColor = .clear
            view.frame = CGRect(x: 10, y: 10, width: 10, height: 10)
            return view
        }
        self.layer.cornerRadius = 4
        self.leftView = textView
        self.leftViewMode = .always
    }

}

extension UITextField {
    // MARK: - Add arrow button to picker text field
    func pickerTextField() {
        var textView: UIView {
            let view = UIView()
            view.backgroundColor = .clear
            view.frame = CGRect(x: 10, y: 10, width: 60, height: 40)
            handelImageViewConstraint(view: view)
            return view
        }
        self.layer.cornerRadius = 4
        self.rightView = textView
        self.rightViewMode = .always
    }
    
    func handelImageViewConstraint(view: UIView) {
        let image       = UIImageView()
        view.addSubview(image)

        image.translatesAutoresizingMaskIntoConstraints = false
        image.image     = UIImage(systemName: "arrowtriangle.down.fill")

        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: view.topAnchor),
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            image.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // MARK: - add tool bar to picker text field
    func addToolBarToPickerTextField(toolBar: UIToolbar) {
        toolBar.barStyle = .default
        toolBar.sizeToFit()
        toolBar.tintColor       = Colors.mainColor
        self.inputAccessoryView = toolBar
    }
}

// MARK: - Text field validation
extension UITextField {
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self.text)
    }
    
    func isValidPhoneNumber() -> Bool {
        let emailRegEx = "[01]+[0,1,2,5]+[0-9]{8}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self.text)
    }
    
    func isValidPassword() -> Bool {
        let emailRegEx = "\\A(?=[^a-z]*[a-z])(?=[^A-Z]*[A-Z])[a-zA-Z0-9!@#$%^&*]{8,20}\\z"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self.text)
    }
}

// MARK: - Handel Secure TextField
let button = UIButton(type: .custom)
extension UITextField {
    func enablePasswordToggle(){
        button.setImage(UIImage(systemName: "eye"), for: .normal)
        button.setImage(UIImage(systemName: "eye.slash"), for: .selected)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -12, bottom: 0, right: 0)
        button.addTarget(self, action: #selector(togglePasswordView), for: .touchUpInside)
        rightView = button
        rightViewMode = .whileEditing
        button.alpha = 0.4
    }
    
    @objc func togglePasswordView(_ sender: Any) {
        isSecureTextEntry.toggle()
        button.isSelected.toggle()
    }
}
