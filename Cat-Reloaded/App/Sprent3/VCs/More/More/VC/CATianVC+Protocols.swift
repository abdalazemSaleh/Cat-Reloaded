//
//  CATianVC+Protocols.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2023-03-29.
//

import UIKit

extension CATianVC: CATianView {
    func showAlerMessage(message: String) {
        presentGFAlert(title: "Woops", message: message, buttonTitle: "OK")
    }
}
