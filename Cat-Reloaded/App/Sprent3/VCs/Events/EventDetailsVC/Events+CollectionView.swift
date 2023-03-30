//
//  Events+CollectionView.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2023-02-06.
//

enum EventDetailsSections: String, CaseIterable {
    case header     = "Scope 22"
}

import UIKit

extension EventDetailsVC {
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: generateLayout())
        view.addSubview(collectionView)
        collectionView.backgroundColor  = .systemBackground
        collectionView.register(EventDetailsHeaderCell.self, forCellWithReuseIdentifier: EventDetailsHeaderCell.reuseIdentifer)
        collectionView.register(CircleBoardCell.self, forCellWithReuseIdentifier: CircleBoardCell.reuseIdentifer)
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: CircleDetailsVC.sectionHeaderElmentKind, withReuseIdentifier: HeaderView.reuseIdentifier)
    }
    /// Handel collectionview flow layout
    private func generateLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { [weak self] (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            let sectionType = EventDetailsSections.allCases[sectionIndex]
            switch sectionType {
            case .header:
                return self?.generateEventDetailsLayout()
            }
        }
        return layout
    }
    
    
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<EventDetailsSections, AnyHashable>(collectionView: collectionView, cellProvider: { (collectionView: UICollectionView, indexPath: IndexPath, model: AnyHashable) -> UICollectionViewCell in
            let sectionType = EventDetailsSections.allCases[indexPath.section]
            switch sectionType {
            case .header:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EventDetailsHeaderCell.reuseIdentifer, for: indexPath) as! EventDetailsHeaderCell
                cell.set(model: model as! EventModel)
                return cell
            }
        })
        // Header
        dataSource.supplementaryViewProvider = { (collectionView: UICollectionView, kind: String, indexPath: IndexPath) -> UICollectionReusableView? in
            guard let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderView.reuseIdentifier, for: indexPath) as? HeaderView else{
                fatalError("Cannot create header view")
            }
            supplementaryView.label.text = EventDetailsSections.allCases[indexPath.section].rawValue
            return supplementaryView
        }
        snapshot.appendSections([.header])
    }

    private func generateEventDetailsLayout() -> NSCollectionLayoutSection {
        // item
        let itemSize    = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item        = NSCollectionLayoutItem(layoutSize: itemSize)
        // group
        let groupSize   = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))

        let group       = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        // section
        let section     = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 48, trailing: 20)
        // Return
        return section
    }
}
