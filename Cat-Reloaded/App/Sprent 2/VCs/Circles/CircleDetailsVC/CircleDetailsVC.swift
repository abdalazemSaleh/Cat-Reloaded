//
//  CircleDetailsVC.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-12-12.
//

import UIKit

class CircleDetailsVC: UIViewController {
    // MARK: - Variables

    static let sectionHeaderElmentKind = "section-header-element-kind"
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<CircleDetailsSections, CircleDetailsModel>!
    
    var itemModel: [CircleDetailsModel] = []
    var headerTest: [CircleDetailsModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        configureDataSource()
        itemModel.append(CircleDetailsModel.init(image: "1", name: "Abdalazem"))
        itemModel.append(CircleDetailsModel.init(image: "2", name: "Ahmed"))
        itemModel.append(CircleDetailsModel.init(image: "3", name: "Mohamed"))
        itemModel.append(CircleDetailsModel.init(image: "1", name: "ssa"))
        itemModel.append(CircleDetailsModel.init(image: "2", name: "as"))
        itemModel.append(CircleDetailsModel.init(image: "3", name: "dfsac"))
        itemModel.append(CircleDetailsModel.init(image: "1", name: "scasda"))
        itemModel.append(CircleDetailsModel.init(image: "2", name: "asdasc"))
        itemModel.append(CircleDetailsModel.init(image: "3", name: "csacsa"))
        
        updateData(on: itemModel)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationController()
    }
    // MARK: - Functions
    private func configureNavigationController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles  =   false
    }
}

enum CompositionalGroupAlignment {
    case vertical
    case horizontal
}

struct CompositionalLayout {
    
    static func createItem(width: NSCollectionLayoutDimension,
                           height: NSCollectionLayoutDimension,
                           spacing: CGFloat
    ) -> NSCollectionLayoutItem {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: width,
                                                                             heightDimension: height))
        item.contentInsets = NSDirectionalEdgeInsets(top: spacing, leading: spacing, bottom: spacing, trailing: spacing)
        return item
    }
    
    static func createGroup(alignment: CompositionalGroupAlignment,
                            width: NSCollectionLayoutDimension,
                            height: NSCollectionLayoutDimension,
                            items: [NSCollectionLayoutItem]
    ) -> NSCollectionLayoutGroup {
        switch alignment {
        case .vertical:
            return NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: width,
                                                                                       heightDimension: height),
                                                    subitems: items)
        case .horizontal:
            return NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: width,
                                                                                         heightDimension: height),
                                                      subitems: items)
        }
    }
    
    static func createGroup(alignment: CompositionalGroupAlignment,
                            width: NSCollectionLayoutDimension,
                            height: NSCollectionLayoutDimension,
                            item: NSCollectionLayoutItem,
                            count: Int
    ) -> NSCollectionLayoutGroup {
        switch alignment {
        case .vertical:
            return NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: width,
                                                                                       heightDimension: height),
                                                    subitem: item,
                                                    count: count)
        case .horizontal:
            return NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: width,
                                                                                         heightDimension: height),
                                                      subitem: item,
                                                      count: count)
        }
    }
}
