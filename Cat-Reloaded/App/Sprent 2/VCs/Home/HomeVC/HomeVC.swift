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
    
    let welcomeCardTitle            = GFTitleLabel(textAlignment: .left, fontSize: 24, weight: .bold)
    let welcomeCard                 = GFCardView(label: "Become a CATian", bodyLabel: "Get new experiences with us and we are engoy this.", image: Images.becomACATian!)
    let welcomeCardStack            = UIStackView()
        
    let aboutCatTitle               = GFTitleLabel(textAlignment: .left, fontSize: 24, weight: .bold)
    let aboutCatCard                = GFCardView(label: "", bodyLabel: "Know more about CAT world", image: Images.becomACATian!)
    let aboutCatCardStack           = UIStackView()
        
    var itemViews: [UIView]         = []
    var sharedView: [UIView]        = []
    let padding: CGFloat            = 20
        
    var podCatVideosUrls: [String]  = []
    var memoriesImageUrl: [String]  = []
    
    var presenter: HomePresenter!
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let gesture = UITapGestureRecognizer(target: self, action: #selector(clickable))
        aboutCatCard.addGestureRecognizer(gesture)
        view.backgroundColor    = .systemBackground
        presenter               = HomePresenter(view: self)
        presenter.fetchMemories()
        presenter.fetchPodCat()
        configureNavigationController()
        configureUI()
        configureCollectionView()
        configureDataSource()
        configureCollectionViewConstraint()
        
        collectionView.refreshControl = UIRefreshControl()
        collectionView.refreshControl?.addTarget(self, action: #selector(refresh), for: .valueChanged)

    }
    
    // MARK: - Functions
    
    func configureNavigationController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles  =   true
    }

    @objc func refresh() {
        presenter.fetchMemories()
        presenter.fetchPodCat()
        collectionView.refreshControl?.endRefreshing()
    }
    
    @objc func clickable() {
        nav(vc: AboutCatVC())
    }
    
}
