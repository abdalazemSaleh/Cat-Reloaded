//
//  CircleDetails+Protocol.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-12-14.
//

import UIKit

extension CircleDetailsVC: CircleDetailsView {
    
    func techCircleDetails(data: [CircleDetailsModel]) {
        snapshot.appendItems(data, toSection: .header)
        snapshot.appendItems(data.first!.board, toSection: .main)
        DispatchQueue.main.async { self.dataSource.apply(self.snapshot, animatingDifferences: true)  }
    }
    
    func nonTechCircleDetails(data: [CircleDetailsModel]) {
        snapshot.appendItems(data, toSection: .header)
        snapshot.appendItems(data.first!.board, toSection: .main)
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
        if currentCircle?.type == "tech" {
            presenter.featchTechCircleDetails(currentCircle?.id ?? "ios")
        } else {
            presenter.featchNonTechCircleDetails(currentCircle?.id ?? "hr")
        }
    }
}
