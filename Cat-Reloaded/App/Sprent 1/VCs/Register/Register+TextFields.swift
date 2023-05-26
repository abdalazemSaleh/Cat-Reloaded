//
//  Register+TextFields.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2023-05-25.
//

import UIKit

extension RegisterVC: UITextFieldDelegate {
    
    func setTextFieldsDelegate() {
        conformPassword.returnKeyType = .done
        let textFields: [UITextField] = [fullName, email, phoneNumber, password, conformPassword]
        for textField in textFields {
            textField.delegate = self
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.switchBasedNextTextField(textField)
        return true
    }
    
    private func switchBasedNextTextField(_ textField: UITextField) {
        switch textField {
        case self.fullName:
            self.email.becomeFirstResponder()
        case self.email:
            self.phoneNumber.becomeFirstResponder()
        case self.phoneNumber:
            self.password.becomeFirstResponder()
        case self.password:
            self.conformPassword.becomeFirstResponder()
        default:
            self.view.endEditing(true)
        }
    }
}
