//
//  HelperUI.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-10-04.
//

import UIKit

#warning("Need to use itm.")
enum CompositionalGroupAlignment {
    case vertical
    case horizontal
}

struct CompositionalLayout {
    // Creat item
    static func createItem(width: NSCollectionLayoutDimension, height: NSCollectionLayoutDimension, spacing: CGFloat) -> NSCollectionLayoutItem {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: width, heightDimension: height))
        item.contentInsets = NSDirectionalEdgeInsets(top: spacing, leading: spacing, bottom: spacing, trailing: spacing)
        return item
    }
    // Creat group using arry of items
    static func createGroup(alignment: CompositionalGroupAlignment, width: NSCollectionLayoutDimension, height: NSCollectionLayoutDimension, items: [NSCollectionLayoutItem]) -> NSCollectionLayoutGroup {
        switch alignment {
        case .vertical:
            return NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: width, heightDimension: height), subitems: items)
        case .horizontal:
            return NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: width, heightDimension: height), subitems: items)
        }
    }
    // Creat group using item and counter
    static func createGroup(alignment: CompositionalGroupAlignment, width: NSCollectionLayoutDimension, height: NSCollectionLayoutDimension, item: NSCollectionLayoutItem, count: Int) -> NSCollectionLayoutGroup {
        switch alignment {
        case .vertical:
            return NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: width, heightDimension: height), subitem: item, count: count)
        case .horizontal:
            return NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: width, heightDimension: height), subitem: item, count: count)
        }
    }
}

#warning("Replace this code in onbording")
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
