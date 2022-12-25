//
//  Home+CollectionView.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-10-11.
//

import UIKit
import Kingfisher

enum Section: String, CaseIterable {
    case headerCell = ""
    case memorires  = "Memories"
    case podCat     = "PodCAT"
}


extension HomeVC {
    /// Configure collection view
    func configureCollectionView() {
        collectionView  = UICollectionView(frame: view.bounds, collectionViewLayout: generateLayout())
        view.addSubview(collectionView)
        snapshot.appendSections([.headerCell, .memorires, .podCat])
        collectionView.delegate = self
        collectionView.backgroundColor  = .systemBackground
        collectionView.register(HeaderCell.self, forCellWithReuseIdentifier: HeaderCell.reuseIdentifer)
        collectionView.register(MemoriesCell.self, forCellWithReuseIdentifier: MemoriesCell.reuseIdentifer)
        collectionView.register(PodCATCell.self, forCellWithReuseIdentifier: PodCATCell.reuseIdentifer)
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: HomeVC.sectionHeaderElementKind, withReuseIdentifier: HeaderView.reuseIdentifier)
    }
    /// Configure collection view data source
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, AnyHashable>(collectionView: collectionView, cellProvider: { (collectionView: UICollectionView, indexPath: IndexPath, model: AnyHashable) -> UICollectionViewCell in
            let sectionType = Section.allCases[indexPath.section]
            switch sectionType {
            case .headerCell:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HeaderCell.reuseIdentifer, for: indexPath) as! HeaderCell
                cell.set(welcometitle: "Welcome Abdalazem", aboutTitle: "About CAT")
                return cell
            case .memorires:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MemoriesCell.reuseIdentifer, for: indexPath) as! MemoriesCell
                guard let myModel   = model as? MemoriesData else { return cell }
                self.memoriesImageUrl.append(myModel.imageUrl)
                cell.set(myModel)
                return cell
            case .podCat:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PodCATCell.reuseIdentifer, for: indexPath) as! PodCATCell
                guard let myModel = model as? PodCatData else { return cell }
                self.podCatVideosUrls.append(myModel.episodeUrl)
                cell.set(myModel)
                return cell
            }
        })
        dataSource.supplementaryViewProvider = { (collectionView: UICollectionView, kind: String, indexPath: IndexPath) -> UICollectionReusableView? in
            guard let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderView.reuseIdentifier, for: indexPath) as? HeaderView else{
                fatalError("Cannot create header view")
            }
            supplementaryView.label.text = Section.allCases[indexPath.section].rawValue
            return supplementaryView
        }
    }
        /// Handel collectionview flow layout
        private func generateLayout() -> UICollectionViewLayout {
            let layout = UICollectionViewCompositionalLayout { [weak self] (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
                let sectionLayoutKind = Section.allCases[sectionIndex]
                switch sectionLayoutKind {
                case .headerCell: return self?.generateHeaderCell()
                case .memorires: return self?.generateMemoriesLayout()
                case .podCat: return self?.generatePodCatLayout()
                }
            }
            return layout
        }
        
        private func generateHeaderCell() -> NSCollectionLayoutSection {
            // item
            let itemSize    = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
            let item        = NSCollectionLayoutItem(layoutSize: itemSize)
            // group
            let groupSize   = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(400))
            let group       = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            // section
            let section     = NSCollectionLayoutSection(group: group)
            // return
            return section
        }
        
        private func generateMemoriesLayout() -> NSCollectionLayoutSection {
            // item
            let itemSize    = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
            let item        = NSCollectionLayoutItem(layoutSize: itemSize)
            // group
            let groupSize   = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(180))
            let group       = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
            // header
            let headerSize  = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(44))
            let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: HomeVC.sectionHeaderElementKind, alignment: .top)
            sectionHeader.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: padding, bottom: 0, trailing: 0)
            // section
            let section     = NSCollectionLayoutSection(group: group)
            section.boundarySupplementaryItems = [sectionHeader]
            section.orthogonalScrollingBehavior = .groupPaging
            // Return
            return section
        }
        
        private func generatePodCatLayout() -> NSCollectionLayoutSection {
            // item
            let itemSize    = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
            let item        = NSCollectionLayoutItem(layoutSize: itemSize)
            // group
            let groupSize   = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(180))
            let group       = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
            // header
            let headerSize  = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(44))
            let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: HomeVC.sectionHeaderElementKind, alignment: .top)
            sectionHeader.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: padding, bottom: 0, trailing: 0)
            // section
            let section     = NSCollectionLayoutSection(group: group)
            section.boundarySupplementaryItems = [sectionHeader]
            section.orthogonalScrollingBehavior = .groupPaging
            // Return
            return section
        }
}

extension HomeVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sectionType = Section.allCases[indexPath.section]
        switch sectionType {
        case .headerCell:
            break
        case .memorires:
            let url = memoriesImageUrl[indexPath.row]
            presentPhoto(with: url)
        case .podCat:
            let url = podCatVideosUrls[indexPath.row]
            openPodCat(with: url)
        }
    }
}

