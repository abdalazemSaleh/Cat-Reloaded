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

    var memoriesCurrentPage = 1
    var num_ofMemories      = 10
        
    var podCatCurrentPage   = 1
    var num_ofPodCat        = 10
    
    var presenter: HomePresenter!
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        add_openCardButton()
        presenter               = HomePresenter(view: self)
        configureCollectionView()
        configureDataSource()
        presenter.isCatian()
        presenter.fetchMemories(page: memoriesCurrentPage)
        presenter.fetchPodCat(page: podCatCurrentPage)
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
        
    @objc private func refresh() {
        print("Working in refrishing")
        presenter.fetchMemories(page: memoriesCurrentPage)
        presenter.fetchPodCat(page: podCatCurrentPage)
        collectionView.refreshControl?.endRefreshing()
    }

}
