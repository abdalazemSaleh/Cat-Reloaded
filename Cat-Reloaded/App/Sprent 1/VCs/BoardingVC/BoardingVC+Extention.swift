//
//  BoardingVC+Extention.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-10-05.
//

import UIKit

protocol Boarding {
    func getPageNumber()
}

extension BoardingVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BoardingCell.cellID, for: indexPath) as! BoardingCell
        cell.set(slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        currenPage  = indexPath.row
        if indexPath.row == 0 {
            previousButton.isHidden = true
        } else {
            previousButton.isHidden = false
        }
    }
}
