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
    
    /// Calculation
    /// first i will make constant : - let membersCounter =    boardarr.counte - 1
    /// pass this value to final group count
    /// final group heigt = memberCounter  * 220 -> (card height)
    /// main group height = final group heigt + 220 -> (Head card height)
    private func generateCirclesLayout() -> NSCollectionLayoutSection {
        // header item layout
        let headerItem  = CompositionalLayout.createItem(width: .fractionalWidth(0.5), height: .fractionalHeight(1), spacing: 0)
        let myinst: CGFloat   = (view.frame.width / 4)
        headerItem.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: myinst, bottom: 8, trailing: myinst)
        // item layout
        let item        = CompositionalLayout.createItem(width: .fractionalWidth(0.5), height: .fractionalHeight(1), spacing: 8)
        // goupSize
        // header group layout
        let headerGroup = CompositionalLayout.createGroup(alignment: .horizontal, width: .fractionalWidth(1), height: .absolute(220), item: headerItem, count: 1)
        // group layout
        let group       = CompositionalLayout.createGroup(alignment: .horizontal, width: .fractionalWidth(1), height: .absolute(220), item: item, count: 2)
        
        let finalGroup  = CompositionalLayout.createGroup(alignment: .vertical, width: .fractionalWidth(1), height: .absolute(880), item: group, count: 4)
        // main group
        let mainGroup   = CompositionalLayout.createGroup(alignment: .vertical, width: .fractionalWidth(1), height: .absolute(1100), items: [headerGroup, finalGroup])
        // header
        let headerSize  = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(44))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: CircleDetailsVC.sectionHeaderElmentKind, alignment: .top)
        sectionHeader.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 12, trailing: 0)
        // section
        let section     = NSCollectionLayoutSection(group: mainGroup)
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 12, bottom: 0, trailing: 12)
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
