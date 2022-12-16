//
//  Home+Protocol.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-12-14.
//

import Foundation

extension HomeVC: HomeView {
    func getMemories(data: MainHomeModel) {
        memories.append(data)
        print("My testArr is:- \(memories)")
        updateData(on: memories)
    }
}
