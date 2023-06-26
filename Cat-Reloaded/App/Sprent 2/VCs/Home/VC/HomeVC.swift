//
//  HomeVC.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-10-11.
//

import UIKit

class HomeVC: UIViewController {
    
    // MARK: - Variables
    static let sectionHeaderElementKind = "section-header-element-kind"
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, AnyHashable>!
    var snapshot = NSDiffableDataSourceSnapshot<Section, AnyHashable>()
    
    var emptyStateView = GFEmptyStateView()
    let padding: CGFloat            = 20
            
    var presenter: HomePresenter!
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        add_openCardButton()
        presenter               = HomePresenter(view: self, service: HomeServices())
        configureCollectionView()
        configureDataSource()
        appendBecomeCatianSection()
        Task {
            await presenter.fetchMemories(page: 1)
            await presenter.fetchPodCat(page: 1)
        }
    }
            
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationController()
    }

    // MARK: - Functions
    private func configureNavigationController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles  = true
    }
    
    func appendBecomeCatianSection() {
        let userData = presenter.getUserData()
        let userName = userData.fullName
        let data: [HomeHeaderCellModel] = [.init(name: userName)]
        snapshot.appendItems([data], toSection: .headerCell)
        DispatchQueue.main.async { self.dataSource.apply(self.snapshot, animatingDifferences: true)  }
    }
}
