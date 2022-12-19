//
//  Home+Protocol.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-12-14.
//

import Foundation

extension HomeVC: HomeView {
    func getPodCat(data: HomeModel) {
        print("Wait for it ")
    }
    
    func getMemories(data: HomeModel) {
        memories = data
        updateData(on: memories.data)
    }
}
