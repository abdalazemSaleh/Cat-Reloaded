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
    var dataSource: UICollectionViewDiffableDataSource<CircleDetailsSections, CircleDetailsModel>!
    
    var currentCircle   = "ios"
    
    var itemModel: [CircleDetailsModel]     = []
    var headerTest: [CircleDetailsModel]    = []
    
    var presenter: CircleDetailsPresenter!
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = CircleDetailsPresenter(view: self)
        presenter.featchTechCircleDetails("ios")
        configureCollectionView()
        configureDataSource()
        testFuncForNow()
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
    
    func testFuncForNow() {
        itemModel.append(CircleDetailsModel.init(image: "1", name: "Abdalazem"))
        itemModel.append(CircleDetailsModel.init(image: "2", name: "Ahmed"))
        itemModel.append(CircleDetailsModel.init(image: "3", name: "Mohamed"))
        itemModel.append(CircleDetailsModel.init(image: "1", name: "ssa"))
        itemModel.append(CircleDetailsModel.init(image: "2", name: "as"))
        itemModel.append(CircleDetailsModel.init(image: "3", name: "dfsac"))
        itemModel.append(CircleDetailsModel.init(image: "1", name: "scasda"))
        itemModel.append(CircleDetailsModel.init(image: "2", name: "asdasc"))
        itemModel.append(CircleDetailsModel.init(image: "3", name: "csacsa"))
        updateData(on: itemModel)
    }
}
