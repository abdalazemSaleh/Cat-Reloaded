//
//  GFTextField.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-10-03.
//

import UIKit


class GFTextField: UITextField {
    
    let attributes = [
        NSAttributedString.Key.foregroundColor : UIColor.secondaryLabel ,
       NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: .medium)
   ]

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    convenience init(placeholder: String) {
        self.init(frame: .zero)
        self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: attributes)
    }
    
    convenience init(SecurePlaceholder: String) {
        self.init(frame: .zero)
        self.isSecureTextEntry = true
        self.attributedPlaceholder = NSAttributedString(string: SecurePlaceholder, attributes: attributes)
        self.enablePasswordToggle()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius          = 4
        layer.borderWidth           = 1
        layer.borderColor           = UIColor.systemGray2.cgColor
                
        textColor                   = .label
        tintColor                   = .label
        textAlignment               = .left
                
        backgroundColor             = .tertiarySystemBackground
        autocorrectionType          = .no
        returnKeyType               = .next
        
        font                        = UIFont.preferredFont(forTextStyle: .body)
        adjustsFontSizeToFitWidth   = true
        minimumFontSize             = 12
        
        handelTextFieldSpacer()
    
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
