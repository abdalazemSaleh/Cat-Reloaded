//
//  CirclesVC+CollectionVIew.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-11-15.
//

import UIKit

enum CirclesSection: CaseIterable {
    case main
}

extension CirclesVC {
    func configureCollectionView() {
        collectionView  = UICollectionView(frame: view.bounds, collectionViewLayout: generateLayout())
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.backgroundColor  = .systemBackground
        collectionView.register(CircleCell.self, forCellWithReuseIdentifier: CircleCell.reuseIdentifer)
        collectionView.register(CircleHeader.self, forSupplementaryViewOfKind: HomeVC.sectionHeaderElementKind, withReuseIdentifier: CircleHeader.reuseIdentifer)
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<CirclesSection, CirclesModel>(collectionView: collectionView, cellProvider: { (collectionView: UICollectionView, indexPath: IndexPath, model: CirclesModel) -> UICollectionViewCell in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CircleCell.reuseIdentifer, for: indexPath) as! CircleCell
                cell.set(model: model)
            return cell
        })
        // Header
        dataSource.supplementaryViewProvider = { (collectionView: UICollectionView, kind: String, indexPath: IndexPath) -> UICollectionReusableView? in
            guard let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CircleHeader.reuseIdentifer, for: indexPath) as? CircleHeader else{
                fatalError("Cannot create header view")
            }
            supplementaryView.delegate  = self
            return supplementaryView
        }
    }
    
    func updateData(on circles: [CirclesModel]) {
        var snapshot = NSDiffableDataSourceSnapshot<CirclesSection, CirclesModel>()
        snapshot.appendSections([.main])
        snapshot.appendItems(circles)
        DispatchQueue.main.async { self.dataSource.apply(snapshot, animatingDifferences: true)  }
    }
    
    /// Handel collectionview flow layout
    private func generateLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { [weak self] (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            return self?.generateCirclesLayout()
        }
        return layout
    }
    
    func generateCirclesLayout() -> NSCollectionLayoutSection {
        // item
        let itemSize    = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1))
        let item        = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        // group
        let groupSize   = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.21))
        let group       = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        // header
        let headerSize  = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(25))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: CirclesVC.sectionHeaderElementKind, alignment: .top)
        sectionHeader.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8)
        // section
        let section     = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 24, leading: 12, bottom: 0, trailing: 12)
        section.boundarySupplementaryItems = [sectionHeader]
        // Return
        return section
    }
}

extension CirclesVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let circle          = data[indexPath.row]
        let vc              = CircleDetailsVC()
        vc.currentCircle    = circle
        nav(vc: vc)
    }
}
