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
    var dataSource: UICollectionViewDiffableDataSource<Section, Image>!
    
    let welcomeCardTitle        = GFTitleLabel(textAlignment: .left, fontSize: 24, weight: .bold)
    let welcomeCard             = GFCardView(label: "Become a CATian", bodyLabel: "Get new experiences with us and we are engoy this.", image: Images.becomACATian!)
    let welcomeCardStack        = UIStackView()
        
    let aboutCatTitle            = GFTitleLabel(textAlignment: .left, fontSize: 24, weight: .bold)
    let aboutCatCard             = GFCardView(label: "", bodyLabel: "Know more about CAT world", image: Images.becomACATian!)
    let aboutCatCardStack        = UIStackView()
    
    var memories: [Image]     = []
    var podCat: [Image]       = []
    
    var itemViews: [UIView]     = []
    var sharedView: [UIView]    = []
    let padding: CGFloat        = 20

    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationController()
//        configureUI()
        configureCollectionView()
        configureDataSource()
//        configureCollectionViewConstraint()
    }
    
    // MARK: - Functions
    func configureNavigationController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles  =   true
    }
}
