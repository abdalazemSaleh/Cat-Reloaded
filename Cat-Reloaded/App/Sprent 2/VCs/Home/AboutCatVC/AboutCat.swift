//
//  AboutCatVC.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-12-19.
//

import UIKit

class AboutCatVC: UIViewController {
    
    // MARK: - Variables
    static let sectionHeaderElmentKind = "section-header-element-kind"
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<AboutCatSections, AnyHashable>!
    var snapshot = NSDiffableDataSourceSnapshot<AboutCatSections, AnyHashable>()
    
    var headerTest: [AboutCatInfoModel] = []
    
    var presenter: AboutCatPresenter!
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter               = AboutCatPresenter(view: self)
        presenter.fetchAboutCatInfo()
        presenter.fetchFounders()
        presenter.fetchTeamBoard()
        configureCollectionView()
        configureDataSource()
        
        collectionView.refreshControl = UIRefreshControl()
        collectionView.refreshControl?.addTarget(self, action: #selector(refresh), for: .valueChanged)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationController()
    }
    
    @objc func refresh() {
        print("Working in refrishing")
        // Fetal error while refetchig about cat info
//        presenter.fetchAboutCatInfo()
        presenter.fetchFounders()
        presenter.fetchTeamBoard()
        collectionView.refreshControl?.endRefreshing()
    }

    // MARK: - Functions
    private func configureNavigationController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles  =   false
    }
}
