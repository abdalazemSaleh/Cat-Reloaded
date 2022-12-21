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
    var dataSource: UICollectionViewDiffableDataSource<AboutCatSections, AboutCatModel>!
    
    var headerTest: [AboutCatInfoModel] = []
    var circles: [AboutCatModel] = []
    var teamBoard: [AboutCatModel] = []
    
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
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationController()
    }
    // MARK: - Functions
    private func configureNavigationController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles  =   false
    }
}
