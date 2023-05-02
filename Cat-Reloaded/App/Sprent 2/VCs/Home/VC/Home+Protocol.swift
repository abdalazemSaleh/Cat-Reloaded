//
//  Home+Protocol.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-12-31.
//

import UIKit

extension HomeVC: HomeView {
    
    func getMemories(data: [MemoriesData]) {
        snapshot.appendItems(data, toSection: .memorires)
        DispatchQueue.main.async { self.dataSource.apply(self.snapshot, animatingDifferences: true)  }
    }
    
    func getPodCat(data: [PodCatData]) {
        snapshot.appendItems(data, toSection: .podCat)
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
    
    
    func presentAlert(message: String, title: String) {
        presentGFAlert(title: title, message: message, buttonTitle: "Go to login")
    }
    
    @objc func retry() {
        emptyStateView.removeFromSuperview()
        self.self.collectionView.isHidden = false
        self.presenter.fetchMemories(page: self.memoriesCurrentPage)
        self.presenter.fetchPodCat(page: self.podCatCurrentPage)
    }
}
