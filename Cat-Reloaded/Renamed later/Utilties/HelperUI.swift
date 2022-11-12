//
//  HelperUI.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-10-04.
//

import UIKit

enum HelperUI {
    
    static func collectionViewFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
        let width                           = view.bounds.width
        
        let flowLayout                      = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing       = 0
        flowLayout.minimumInteritemSpacing  = 0
        flowLayout.scrollDirection          = .horizontal
        flowLayout.itemSize                 = CGSize(width: width, height: 296)
        return flowLayout
    }
    
    static func memoriesCollectionViewFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
        let width                           = view.bounds.width
        
        let flowLayout                      = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing       = 0
        flowLayout.minimumInteritemSpacing  = 0
        flowLayout.scrollDirection          = .horizontal
        flowLayout.itemSize                 = CGSize(width: width - 40, height: 180)
        return flowLayout
    }
    
}
