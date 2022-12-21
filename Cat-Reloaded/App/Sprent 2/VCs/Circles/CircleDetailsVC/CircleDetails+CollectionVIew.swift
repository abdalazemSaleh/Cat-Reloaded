//
//  CircleDetails+CollectionVIew.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-12-14.
//

import UIKit

enum CircleDetailsSections: String, CaseIterable {
    case header = "iOS Circle"
    case main   = "Circle Board"
}

extension CircleDetailsVC {
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: generateLayout())
        view.addSubview(collectionView)
        collectionView.backgroundColor  = .systemBackground
        collectionView.register(CircleDetailsHeaderCell.self, forCellWithReuseIdentifier: CircleDetailsHeaderCell.reuseIdentifer)
        collectionView.register(CircleBoardCell.self, forCellWithReuseIdentifier: CircleBoardCell.reuseIdentifer)
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: CircleDetailsVC.sectionHeaderElmentKind, withReuseIdentifier: HeaderView.reuseIdentifier)
    }
    
    /// Handel collectionview flow layout
    private func generateLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { [weak self] (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            let sectionLayoutKind   = CircleDetailsSections.allCases[sectionIndex]
            switch sectionLayoutKind {
            case .header:
                return self?.generateCircleHeaderLayout()
            case .main:
                return self?.generateCirclesLayout()
            }
        }
        return layout
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<CircleDetailsSections, CircleDetailsModel>(collectionView: collectionView, cellProvider: { (collectionView: UICollectionView, indexPath: IndexPath, model: CircleDetailsModel) -> UICollectionViewCell in
            let sectionType = CircleDetailsSections.allCases[indexPath.section]
            switch sectionType {
            case .header:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CircleDetailsHeaderCell.reuseIdentifer, for: indexPath) as! CircleDetailsHeaderCell
                print("my size: - \(cell.bounds.height)")
                return cell
            case .main:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CircleBoardCell.reuseIdentifer, for: indexPath) as! CircleBoardCell
//                cell.set(image: model.image, circleName: model.name)
                return cell
            }
        })
        // Header
        dataSource.supplementaryViewProvider = { (collectionView: UICollectionView, kind: String, indexPath: IndexPath) -> UICollectionReusableView? in
            guard let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderView.reuseIdentifier, for: indexPath) as? HeaderView else{
                fatalError("Cannot create header view")
            }
            supplementaryView.label.text = CircleDetailsSections.allCases[indexPath.section].rawValue
            return supplementaryView
        }
    }

    private func generateCircleHeaderLayout() -> NSCollectionLayoutSection {
        // item
        let itemSize    = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item        = NSCollectionLayoutItem(layoutSize: itemSize)
        // group
        let groupSize   = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(550))
        let group       = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        // section
        let section     = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 48, trailing: 20)
        // Return
        return section
    }
    
    private func generateCirclesLayout() -> NSCollectionLayoutSection {
        // item
        let itemSize    = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1))
        let item        = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        // group
        let groupSize   = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.2))
        let group       = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        // header
        let headerSize  = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(44))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: CircleDetailsVC.sectionHeaderElmentKind, alignment: .top)
        sectionHeader.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 0)
        // section
        let section     = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 12)
        section.boundarySupplementaryItems = [sectionHeader]
        // Return
        return section
    }
    
    func updateData(on circles: [CircleDetailsModel]) {
        headerTest.append(CircleDetailsModel.init(image: "3", name: "Test!."))
        var snapshot = NSDiffableDataSourceSnapshot<CircleDetailsSections, CircleDetailsModel>()
        
        snapshot.appendSections([.header])
        snapshot.appendItems(headerTest)
        
        snapshot.appendSections([.main])
        snapshot.appendItems(circles)
        DispatchQueue.main.async { self.dataSource.apply(snapshot, animatingDifferences: true)  }
    }

    
}
