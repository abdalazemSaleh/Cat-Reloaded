//
//  EventDetailsVC.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2023-02-06.
//

import UIKit

class EventDetailsVC: UIViewController {
    // MARK: - Variables
    static let sectionHeaderElmentKind = "section-header-element-kind"
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<EventDetailsSections, AnyHashable>!
    var snapshot = NSDiffableDataSourceSnapshot<EventDetailsSections, AnyHashable>()

    var model: [EventModel]    = []
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        configureDataSource()

        snapshot.appendItems(model, toSection: .header)
        DispatchQueue.main.async { self.dataSource.apply(self.snapshot, animatingDifferences: true)  }
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
}
