//
//  CirclesVC+Protocol.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-11-15.
//

import Foundation

extension CirclesVC: checkSelectedIndex {
    func checkIndex(_ index: Int) {
        if index == 0 {
            presenter.fetchTechCircles()
        } else {
            presenter.fetchNonTechCircles()
        }
    }
}

extension CirclesVC: CirclesView {
    func techCircles(data: [CirclesModel]) {
        updateData(on: data)
    }
    
    func nonTechCircles(data: [CirclesModel]) {
        updateData(on: data)
    }
}
