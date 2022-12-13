//
//  GFTextView.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-12-13.
//

import UIKit

class GFTextView: UITextView {
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        configure()
    }
    
    convenience init(textAlignment: NSTextAlignment, fontSize: CGFloat, weight: UIFont.Weight) {
        self.init(frame: .zero)
        self.textAlignment  = textAlignment
        self.font           = UIFont.systemFont(ofSize: fontSize, weight: weight)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        sizeToFit()
        textColor       = .label
        isScrollEnabled = false
        isEditable      = false
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
