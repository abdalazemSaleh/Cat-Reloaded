//
//  GFTransactionButton.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-10-05.
//

import TransitionButton
import UIKit

extension TransitionButton {
    func customTransactionButton(title: String) {
        translatesAutoresizingMaskIntoConstraints = false
        setTitleColor(.white, for: .normal)
        setTitle(title, for: .normal)
        layer.cornerRadius      = 8
        titleLabel?.font        = UIFont.preferredFont(forTextStyle: .headline)
        backgroundColor         = Colors.mainColor
        translatesAutoresizingMaskIntoConstraints = false
    }
    func handelButtonAfterStopAnimation() {
            self.stopAnimation()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.cornerRadius  = 8
        }
    }
}
