//
//  GFTransactionButton.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-10-05.
//

import TransitionButton

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
            self.cornerRadius  = 8
    }
}
