//
//  Profile+TextField.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2023-05-25.
//

import UIKit

extension ProfileVC: UITextFieldDelegate {
    
    func setTextFieldsDelegate() {
        emailTextField.returnKeyType = .done
        let textFields: [UITextField] = [fullNameTextField, phoneNumberTextField, emailTextField]
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
        case self.fullNameTextField:
            self.phoneNumberTextField.becomeFirstResponder()
        case self.phoneNumberTextField:
            self.emailTextField.becomeFirstResponder()
        default:
            self.view.endEditing(true)
        }
    }
}
