//
//  GFAlert.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2023-03-30.
//

import UIKit

class GFAlertView: UIView {
    
    var message: String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureMyView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    convenience init(message: String) {
        self.init(frame: .zero)
        self.message = message
        configureMyView()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureMyView() {
        backgroundColor = .secondarySystemBackground
        layer.cornerRadius = 16
        configureLabel()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            self.showAlert()
        }
    }
    
    private func configureLabel() {
        let label = GFBodyLabel(textAlignment: .left)
        label.numberOfLines = 0
        label.text = message
        addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
    
    private func showAlert() {
        self.frame = CGRect(x: 20, y:-80, width: self.superview!.frame.width - 40, height: 80)
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn) {
            self.frame = CGRect(x: 20, y: self.superview!.safeAreaInsets.top + 8, width: self.superview!.frame.width - 40, height: 80)
        } completion: { _ in
            UIView.animate(withDuration: 0.5, delay: 5, options: .curveEaseIn) {
                self.frame = CGRect(x: 20, y: -80, width: self.superview!.frame.width - 40, height: 80)
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            self.removeFromSuperview()
        }
    }
}
