//
//  AboutCat+Protocol.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-12-31.
//

import UIKit

extension AboutCatVC: AboutCatView {
    
    func aboutCatInfo(data: [AboutCatInfoModel]) {
        snapshot.appendItems(data, toSection: .header)
        DispatchQueue.main.async { self.dataSource.apply(self.snapshot, animatingDifferences: true)  }
    }
    
    func founders(data: [TeamBoardModel]) {
        snapshot.appendItems(data, toSection: .founders)
        DispatchQueue.main.async { self.dataSource.apply(self.snapshot, animatingDifferences: true)  }
    }
    
    func teamBoard(data: [TeamBoardModel]) {
        snapshot.appendItems(data, toSection: .taemBoard)
        DispatchQueue.main.async { self.dataSource.apply(self.snapshot, animatingDifferences: true)  }
    }
    
    func presentEmptyView(message: String, image: UIImage) {
        DispatchQueue.main.async {
            self.collectionView.isHidden = true
            self.emptyStateView.ImageView.image     = image
            self.emptyStateView.errorMessage.text   = message
            self.emptyStateView.retryButton.addTarget(self, action: #selector(self.retry), for: .touchUpInside)
            self.emptyStateView.frame = self.view.bounds
            self.view.addSubview(self.emptyStateView)
        }
    }
    
    @objc func retry() {
        emptyStateView.removeFromSuperview()
        self.self.collectionView.isHidden = false
        self.presenter.fetchAboutCatInfo()
        self.presenter.fetchFounders()
        self.presenter.fetchTeamBoard()
    }

}
