//
//  AboutCatVC+CollectionView.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-12-31.
//

import UIKit

enum AboutCatSections: String, CaseIterable {
    case header     = ""
    case founders   = "Founders"
    case taemBoard  = "Team Board"
}

extension AboutCatVC {
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: generateLayout())
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(AboutCatHeaderCell.self, forCellWithReuseIdentifier: AboutCatHeaderCell.reuseIdentifer)
        collectionView.register(CircleBoardCell.self, forCellWithReuseIdentifier: CircleBoardCell.reuseIdentifer)
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: AboutCatVC.sectionHeaderElmentKind, withReuseIdentifier: HeaderView.reuseIdentifier)
        collectionView.delegate = self
    }
    
    private func generateLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { [weak self] (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            let sectionLayoutKind   = AboutCatSections.allCases[sectionIndex]
            switch sectionLayoutKind {
            case .header:
                return self?.generateAboutCatHeaderLayout()
            case .founders:
                return self?.generateFoundersLayout()
            case .taemBoard:
                return self?.generateTeamBoardLayout()
            }
        }
        return layout
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<AboutCatSections, AnyHashable>(collectionView: collectionView, cellProvider: { (collectionView: UICollectionView, indexPath: IndexPath, model: AnyHashable) -> UICollectionViewCell in
            let sectionType = AboutCatSections.allCases[indexPath.section]
            switch sectionType {
            case .header:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AboutCatHeaderCell.reuseIdentifer, for: indexPath) as! AboutCatHeaderCell
                guard let myModel = model as? AboutCatInfoModel else { return cell }
                cell.set(model: myModel)
                return cell
            case .founders:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CircleBoardCell.reuseIdentifer, for: indexPath) as! CircleBoardCell
                cell.borderView.layer.borderColor = Colors.mainColor?.cgColor
                guard let myModel = model as? TeamBoardModel else { return cell}
                cell.set(model: myModel)
                return cell
            case .taemBoard:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CircleBoardCell.reuseIdentifer, for: indexPath) as! CircleBoardCell
                guard let myModel = model as? TeamBoardModel else { return cell }
                cell.borderView.layer.borderColor = UIColor.clear.cgColor
                cell.set(model: myModel)
                return cell
            }
        })
        // Header
        dataSource.supplementaryViewProvider = { (collectionView: UICollectionView, kind: String, indexPath: IndexPath) -> UICollectionReusableView? in
            guard let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderView.reuseIdentifier, for: indexPath) as? HeaderView else{
                fatalError("Cannot create header view")
            }
            supplementaryView.label.text = AboutCatSections.allCases[indexPath.section].rawValue
            return supplementaryView
        }
        snapshot.appendSections([.header, .founders, .taemBoard])
    }
    
    private func generateAboutCatHeaderLayout() -> NSCollectionLayoutSection {
        // item
        let item    = CompositionalLayout.createItem(width: .fractionalWidth(1), height: .fractionalHeight(1), spacing: 0)
        // group
        let group   = CompositionalLayout.createGroup(alignment: .vertical, width: .fractionalWidth(1), height: .absolute(820), items: [item])
        // section
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 48, trailing: 20)
        // Return
        return section
    }
    
    private func generateFoundersLayout() -> NSCollectionLayoutSection {
        // header item layout
        let headerItem  = CompositionalLayout.createItem(width: .fractionalWidth(0.5), height: .fractionalHeight(1), spacing: 0)
        let myinst: CGFloat   = (view.frame.width / 4)
        headerItem.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: myinst, bottom: 8, trailing: myinst)
        // item layout
        let item        = CompositionalLayout.createItem(width: .fractionalWidth(0.5), height: .fractionalHeight(1), spacing: 8)
        // goupSize
        // header group layout
        let headerGroup = CompositionalLayout.createGroup(alignment: .horizontal, width: .fractionalWidth(1), height: .fractionalHeight(0.5), item: headerItem, count: 1)
        // group layout
        let group       = CompositionalLayout.createGroup(alignment: .horizontal, width: .fractionalWidth(1), height: .fractionalHeight(0.5), item: item, count: 2)
        // main group
        let mainGroup   = CompositionalLayout.createGroup(alignment: .vertical, width: .fractionalWidth(1), height: .absolute(440), items: [headerGroup, group])
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
    
    private func generateTeamBoardLayout() -> NSCollectionLayoutSection {
        // item
        let item    = CompositionalLayout.createItem(width: .fractionalWidth(0.95), height: .fractionalHeight(0.5), spacing: 8)
        // group
        let group   = CompositionalLayout.createGroup(alignment: .vertical, width: .fractionalWidth(0.5), height: .absolute(440), items: [item, item])
        // header
        let headerSize  = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(44))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: CircleDetailsVC.sectionHeaderElmentKind, alignment: .top)
        sectionHeader.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 0)
        // section
        let section     = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 12, bottom: 0, trailing: 12)
        section.boundarySupplementaryItems = [sectionHeader]
        section.orthogonalScrollingBehavior = .continuous
        // Return
        return section
    }
}

extension AboutCatVC: UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if !showen {
            let visibleRect = CGRect(origin: collectionView.contentOffset, size: collectionView.bounds.size)
            let visiblePoint = CGPoint(x: visibleRect.midX - 140, y: visibleRect.midY - 140)
            if let indexPath = collectionView.indexPathForItem(at: visiblePoint), indexPath.section == 1 {
                UIView.animate(withDuration: 1, delay: 0) {
                    let indexPath = IndexPath(item: 2, section: 2)
                    self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: false)
                } completion: { _ in
                    UIView.animate(withDuration: 1, delay: 0) {
                        let indexPath = IndexPath(item: 0, section: 2)
                        self.collectionView.scrollToItem(at: indexPath, at: .left, animated: false)
                    }
                }
                showen = true
            }
        }
    }
}
