//
//  EventsVC.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-10-11.
//

import UIKit

enum EventDate {
    case upComing
    case previous
}

class EventsVC: UIViewController {    

    // MARK: - Variables
    static let sectionHeaderElementKind = "section-header-element-kind"
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<eventSections, EventModel>!
        
    let segmentView = CustomSegmentedControl()
    
    var data: [EventModel] = []
    
    var presenter: EventsPresenter!
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        add_openCardButton()
        presenter = EventsPresenter(view: self)
        configureCollectionView()
        configureCollectionViewDataSource()
        presenter.fetchUpComingEvents()
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
