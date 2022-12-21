//
//  AboutCat+Protocol.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-12-21.
//

import UIKit

extension AboutCatVC: AboutCatView {
    func aboutCatInfo(data: AboutCatInfoModel) {
        headerTest.append(AboutCatInfoModel.init(about: data.about, history: data.history, vision: data.vision))
        snapshot.appendItems(headerTest, toSection: .header)
        DispatchQueue.main.async { self.dataSource.apply(self.snapshot, animatingDifferences: true)  }
    }
    
    func founders(data: [FoundersModel]) {
        snapshot.appendItems(data, toSection: .founders)
        DispatchQueue.main.async { self.dataSource.apply(self.snapshot, animatingDifferences: true)  }
    }

    func teamBoard(data: [TeamBoardModel]) {
        snapshot.appendItems(data, toSection: .taemBoard)
        DispatchQueue.main.async { self.dataSource.apply(self.snapshot, animatingDifferences: true)  }
    }
}
