//
//  CircleDetailsVC.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-12-12.
//

import UIKit

class CircleDetailsVC: UIViewController {
    
    // MARK: - Variables
    static let sectionHeaderElmentKind = "section-header-element-kind"
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<CircleDetailsSections, AnyHashable>!
    var snapshot = NSDiffableDataSourceSnapshot<CircleDetailsSections, AnyHashable>()
    
    var currentCircle: CirclesModel?
        
    var emptyStateView = GFEmptyStateView()
    
    var presenter: CircleDetailsPresenter!
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = CircleDetailsPresenter(view: self)
        configureCollectionView()
        configureDataSource()
        fetchCircleData()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationController()
    }
    // MARK: - Functions
    private func configureNavigationController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles  =   false
        
        navigationController?.navigationBar.tintColor = Colors.mainColor
    }
    
    private func fetchCircleData() {
        if currentCircle?.type == "tech" {
            presenter.featchTechCircleDetails(currentCircle?.id ?? "ios")
        } else {
            presenter.featchNonTechCircleDetails(currentCircle?.id ?? "hr")
        }
    }
}
