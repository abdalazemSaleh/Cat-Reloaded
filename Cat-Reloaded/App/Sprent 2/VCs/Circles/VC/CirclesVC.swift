//
//  CirclesVC.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-10-11.
//

import UIKit

enum CirclesSection {
    case main
}

struct CirclesModel: Hashable {
    let circleName: String
    let circleImage: UIImage
}

class CirclesVC: UIViewController {

//    // MARK: - Vailables
//    static let sectionHeaderElementKind = "section-header-element-kind"
//    var collectionView: UICollectionView!
//    var dataSource: UICollectionViewDiffableDataSource<CirclesSection, CirclesModel>!
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
//        configureCollectionView()
        
    }
    
//    private func configureCollectionView() {
//        collectionView  = UICollectionView(frame: view.bounds, collectionViewLayout: generateLayout())
//        view.addSubview(collectionView)
//        collectionView.backgroundColor  = .systemBackground
//        
//    }
//
//    
//    private func configureDataSource() {
//        dataSource = UICollectionViewDiffableDataSource<CirclesSection, CirclesModel>(collectionView: collectionView, cellProvider: { (collectionView: UICollectionView, indexPath: IndexPath, model: CirclesModel) -> UICollectionViewCell in
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HeaderCell.reuseIdentifer, for: indexPath) as! HeaderCell
//            cell.set(welcometitle: "Welcome Abdalazem", aboutTitle: "About CAT")
//            return cell
//        })
//    }
//    
//    /// Handel collectionview flow layout
//    private func generateLayout() -> UICollectionViewLayout {
//        let layout = UICollectionViewCompositionalLayout { [weak self] (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
//            return self?.generateMemoriesLayout()
//        }
//        return layout
//    }
//    
//    
//    func generateMemoriesLayout() -> NSCollectionLayoutSection {
//        // item
//        let itemSize    = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
//        let item        = NSCollectionLayoutItem(layoutSize: itemSize)
//        // group
//        let groupSize   = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.4), heightDimension: .absolute(180))
//        let group       = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
//        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
//        // section
//        let section     = NSCollectionLayoutSection(group: group)
////        section.boundarySupplementaryItems = [sectionHeader]
//        section.orthogonalScrollingBehavior = .groupPaging
//        // Return
//        return section
//    }


    
}
