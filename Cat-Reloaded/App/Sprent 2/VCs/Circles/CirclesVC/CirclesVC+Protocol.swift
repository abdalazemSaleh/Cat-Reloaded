//
//  CirclesVC+Protocol.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-11-15.
//

import Foundation

extension CirclesVC: checkCirclesType {
    func checkIndex(_ index: Int) {
        if index == 0 {
            updateData(on: tech)
        } else {
            updateData(on: nonTech)
        }
    }
}
