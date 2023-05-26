//
//  CirclesVC.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-10-11.
//

import UIKit

enum CircleType {
    case tech
    case nonTech
}

class CirclesVC: UIViewController {
    var finalIndex = 0
    
    // MARK: - Vailables
    static let sectionHeaderElementKind = "section-header-element-kind"
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<CirclesSection, CirclesModel>!
            
    var presenter: CirclesPresenter!
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        add_openCardButton()
        presenter = CirclesPresenter(view: self)
        configureCollectionView()
        configureDataSource()
        presenter.fetchTechCircles()
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
}
