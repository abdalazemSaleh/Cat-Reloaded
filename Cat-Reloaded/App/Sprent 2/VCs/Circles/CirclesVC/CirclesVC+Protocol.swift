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
            selectedCircle.removeAll()
            data.removeAll()
            appendModel(type: .tech)
        } else {
            selectedCircle.removeAll()
            data.removeAll()
            appendModel(type: .nonTech)
        }
    }
}

extension CirclesVC: CirclesView {
    func techCircles(data: [CirclesModel]) {
        print("my data: - \(data)")
        updateData(on: data)
    }
    
    func nonTechCircles(data: [CirclesModel]) {
        updateData(on: data)
    }
}
