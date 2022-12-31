//
//  HomeVC.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-10-11.
//

import UIKit

struct Image: Hashable {
    let image: String
}

class HomeVC: UIViewController {
    
    // MARK: - Variables
    var scrollView: UIScrollView!
    var contentView: UIView!
    
    static let sectionHeaderElementKind = "section-header-element-kind"
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, AnyHashable>!
    var snapshot = NSDiffableDataSourceSnapshot<Section, AnyHashable>()
    
    let padding: CGFloat            = 20
        
    var podCatVideosUrls: [String]  = []
    var memoriesImageUrl: [String]  = []
    
    var isCatian: Bool = false
    
    var presenter: HomePresenter!
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter               = HomePresenter(view: self)
        configureNavigationController()
        presenter.fetchMemories()
        presenter.fetchPodCat()
        configureCollectionView()
        configureDataSource()
        configureHeaderCell()
    }
    
    // MARK: - Functions
    func configureNavigationController() {
        view.backgroundColor    = .systemBackground
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles  = true
    }
    
    func configureHeaderCell() {
        let userData = UserData.getUserModel()
        if userData?.isCatian ?? false {
            print("is allready in")
        } else {
            var myArr: [HomeHeaderCellModel] = []
            myArr.append(.init(name: userData?.fullName))
            snapshot.appendItems(myArr, toSection: .headerCell)
        }
    }
}
