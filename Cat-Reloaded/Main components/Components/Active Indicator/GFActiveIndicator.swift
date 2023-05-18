//
//  GFActiveIndicator.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2023-03-21.
//

import UIKit

class GFActiveIndicator: UIView {
    
    let spinningCircle = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        frame = CGRect(x: 0, y: 0, width: 32, height: 32)
        
        let rect = self.bounds
        let circularPath = UIBezierPath(ovalIn: rect)
        
        spinningCircle.path = circularPath.cgPath
        spinningCircle.fillColor = UIColor.clear.cgColor
        spinningCircle.strokeColor = UIColor.white.cgColor
        spinningCircle.lineWidth = 2
        spinningCircle.strokeEnd = 0.75
        spinningCircle.lineCap = .round
        self.layer.addSublayer(spinningCircle)
    }
    
    func animate() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear) {
            self.transform = CGAffineTransform(rotationAngle: .pi)
        } completion: { _ in
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear) {
                self.transform = CGAffineTransform(rotationAngle: 0)
                
            } completion: { _ in
                self.animate()
            }
        }
    }
}

