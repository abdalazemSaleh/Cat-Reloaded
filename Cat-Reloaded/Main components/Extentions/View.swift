//
//  View.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2023-03-29.
//

import UIKit

extension UIView {
    func addShadow() {
        self.layer.shadowColor = UIColor.label.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 5
    }
}

// Make constraint
public struct AnchoredConstraints {
    public var top: NSLayoutConstraint?
    public var leading: NSLayoutConstraint?
    public var bottom: NSLayoutConstraint?
    public var trailing: NSLayoutConstraint?
    public var centerX: NSLayoutConstraint?
    public var centerY: NSLayoutConstraint?
    public var width: NSLayoutConstraint?
    public var height: NSLayoutConstraint?
}
extension UIView {
    @discardableResult
    public func makeConstraints(
          topAnchor: NSLayoutYAxisAnchor? = nil,
          bottomAnchor: NSLayoutYAxisAnchor? = nil,
          leadingAnchor: NSLayoutXAxisAnchor? = nil,
          trailingAnchor: NSLayoutXAxisAnchor? = nil,
          centerXAnchor: NSLayoutXAxisAnchor? = nil,
          centerYAnchor: NSLayoutYAxisAnchor? = nil,
          padding: UIEdgeInsets = .zero,
          size: CGSize = .zero ) -> AnchoredConstraints {
              
            translatesAutoresizingMaskIntoConstraints = false
          
            var anchoredConstraints = AnchoredConstraints()

            if let topAnchor = topAnchor {
                anchoredConstraints.top = self.topAnchor.constraint(equalTo: topAnchor, constant: padding.top)
            }

            if let leadingAnchor = leadingAnchor {
                anchoredConstraints.leading = self.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding.left)
            }

            if let bottomAnchor = bottomAnchor {
                anchoredConstraints.bottom = self.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding.bottom)
            }
                  
            if let trailingAnchor = trailingAnchor {
                anchoredConstraints.trailing = self.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding.right)
            }
              
            if let centerXAnchor = centerXAnchor {
                anchoredConstraints.centerX = self.centerXAnchor.constraint(equalTo: centerXAnchor, constant: padding.right > 0 ? -padding.right : padding.left)
            }
            
            if let centerYAnchor = centerYAnchor {
                anchoredConstraints.centerY = self.centerYAnchor.constraint(equalTo: centerYAnchor, constant: padding.top > 0 ? padding.top : -padding.bottom)
            }
            
            if size.width != 0 {
              anchoredConstraints.width = widthAnchor.constraint(equalToConstant: size.width)
            }

            if size.height != 0 {
              anchoredConstraints.height = heightAnchor.constraint(equalToConstant: size.height)
            }

              [anchoredConstraints.top, anchoredConstraints.leading, anchoredConstraints.bottom, anchoredConstraints.trailing, anchoredConstraints.width, anchoredConstraints.height, anchoredConstraints.centerX, anchoredConstraints.centerY].forEach { $0?.isActive = true }

            return anchoredConstraints
        }
}

