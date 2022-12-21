//
//  Home+Protocol.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-12-14.
//

import Foundation

extension HomeVC: HomeView {
    func getMemories(data: MemoriesModel) {
        let memories = data.data
        snapshot.appendItems(memories, toSection: .memorires)
        DispatchQueue.main.async { self.dataSource.apply(self.snapshot, animatingDifferences: true)  }
    }

    func getPodCat(data: PodCatModel) {
        let podCat =  data.data
        snapshot.appendItems(podCat, toSection: .podCat)
        DispatchQueue.main.async { self.dataSource.apply(self.snapshot, animatingDifferences: true)  }
    }
}
