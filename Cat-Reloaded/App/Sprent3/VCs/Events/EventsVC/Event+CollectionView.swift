//
//  Event+CollectionView.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2023-02-03.
//

import UIKit

enum eventSections: CaseIterable {
    case main
}

extension EventsVC {
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: generateLayout())
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.register(EventCell.self, forCellWithReuseIdentifier: EventCell.reuseIdentifer)
        collectionView.register(EventsHeader.self, forSupplementaryViewOfKind: HomeVC.sectionHeaderElementKind, withReuseIdentifier: EventsHeader.reuseIdentifer)
    }
    
    func configureCollectionViewDataSource() {
        dataSource = UICollectionViewDiffableDataSource<eventSections, EventModel>(collectionView: collectionView, cellProvider: { (collectionView: UICollectionView, indexPath: IndexPath, model: EventModel) -> UICollectionViewCell in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EventCell.reuseIdentifer, for: indexPath) as! EventCell
            cell.set(model)
            return cell
        })
        // Header
        dataSource.supplementaryViewProvider = { (collectionView: UICollectionView, kind: String, indexPath: IndexPath) -> UICollectionReusableView? in
            guard let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: EventsHeader.reuseIdentifer, for: indexPath) as? EventsHeader else{
                fatalError("Cannot create header view")
            }
            supplementaryView.delegate  = self
            return supplementaryView
        }
    }
    
    func updateData(on events: [EventModel]) {
        var snapshot = NSDiffableDataSourceSnapshot<eventSections, EventModel>()
        snapshot.appendSections([.main])
        snapshot.appendItems(events)
        DispatchQueue.main.async { self.dataSource.apply(snapshot, animatingDifferences: true)  }
    }
    
    /// Handel collectionview flow layout
    private func generateLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { [weak self] (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            return self?.generateEventsLayout()
        }
        return layout
    }
    
    func generateEventsLayout() -> NSCollectionLayoutSection {
        // item
        let itemSize    = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item        = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        // group
        let groupSize   = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(240))
        let group       = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        // header
        let headerSize  = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(25))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: CirclesVC.sectionHeaderElementKind, alignment: .top)
        sectionHeader.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8)
        // section
        let section     = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 24, leading: 12, bottom: 16, trailing: 12)
        section.boundarySupplementaryItems = [sectionHeader]
        // Return
        return section
    }
}

extension EventsVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc              = EventDetailsVC()
        let model = data[indexPath.row]
        vc.model.append(model)
        nav(vc: vc)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.alpha = 0
        UIView.animate(withDuration: 0.5, delay: 0.05 * Double(indexPath.row) ) {
            cell.alpha = 1
        }
    }
}
