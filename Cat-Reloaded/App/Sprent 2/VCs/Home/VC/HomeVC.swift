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
    
    var memoriesPages       = 1
    var memoriesCurrentPage = 1
    var num_ofMemories      = 10
    var podCatPages         = 1
    var podCatCurrentPage   = 1
    var num_ofPodCat        = 10
    
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
        presenter.fetchMemories(page: memoriesCurrentPage)
        presenter.fetchPodCat(page: podCatCurrentPage)
        configureCollectionView()
        configureDataSource()
        configureHeaderCell()
        
        collectionView.refreshControl = UIRefreshControl()
        collectionView.refreshControl?.addTarget(self, action: #selector(refresh), for: .valueChanged)
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
    
    private func configureHeaderCell() {
        let userData = UserData.getUserModel()
        if userData?.isCatian ?? false {
            print("is allready in")
        } else {
            var myArr: [HomeHeaderCellModel] = []
            myArr.append(.init(name: userData?.fullName))
            snapshot.appendItems(myArr, toSection: .headerCell)
        }
    }
    
    @objc private func refresh() {
        print("Working in refrishing")
        presenter.fetchMemories(page: memoriesCurrentPage)
        presenter.fetchPodCat(page: podCatCurrentPage)
        collectionView.refreshControl?.endRefreshing()
    }

}
