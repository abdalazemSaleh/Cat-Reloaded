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

#warning("Chache Circles Data")
class CirclesVC: UIViewController, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        nav(vc: CircleDetailsVC())
    }
    
    // MARK: - Vailables
    static let sectionHeaderElementKind = "section-header-element-kind"
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<CirclesSection, CirclesModel>!
        
    var presenter: CirclesPresenter!
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = CirclesPresenter(view: self)
        configureCollectionView()
        configureDataSource()
        appendModel(type: .tech)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationController()
    }
    // MARK: - Functions
    func configureNavigationController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles  =   true
    }
    
    func appendModel(type: CircleType) {
        switch type {
        case .tech:
            presenter.fetchTechCircles()
        case .nonTech:
            presenter.fetchNonTechCircles()
        }
    }
}
