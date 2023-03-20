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
    // MARK: - Vailables
    static let sectionHeaderElementKind = "section-header-element-kind"
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<CirclesSection, CirclesModel>!
            
    var presenter: CirclesPresenter!
    var data: [CirclesModel] = []
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
    private func configureNavigationController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles  = true        
    }
    
    func appendModel(type: CircleType) {
        switch type {
        case .tech:
            data.append(.init(id: "ios", imageUrl: "ios", name: "iOS", type: "tech"))
            data.append(.init(id: "android", imageUrl: "android", name: "Android", type: "tech"))
            data.append(.init(id: "backend", imageUrl: "Back", name: "Back-End", type: "tech"))
            data.append(.init(id: "security", imageUrl: "cyber", name: "Cyber Security", type: "tech"))
            data.append(.init(id: "datascience", imageUrl: "data", name: "Data Scince", type: "tech"))
            data.append(.init(id: "flutter", imageUrl: "flutter", name: "Flutter", type: "tech"))
            data.append(.init(id: "frontend", imageUrl: "front", name: "Front-end", type: "tech"))
            data.append(.init(id: "gamedev", imageUrl: "gaming", name: "Game Development", type: "tech"))
            data.append(.init(id: "uiux", imageUrl: "ui", name: "UI/UX", type: "tech"))
            data.append(.init(id: "cs", imageUrl: "ios", name: "Computer Science", type: "tech"))
            data.append(.init(id: "embedded", imageUrl: "ios", name: "Embedded Systems", type: "tech"))
            updateData(on: data)
//            presenter.fetchTechCircles()
        case .nonTech:
            data.append(.init(id: "hr", imageUrl: "HR", name: "HR", type: "nontech"))
            data.append(.init(id: "logistics", imageUrl: "Logistics", name: "Logistics", type: "nontech"))
            data.append(.init(id: "media", imageUrl: "Media", name: "Media", type: "nontech"))
            data.append(.init(id: "prfr", imageUrl: "PR", name: "PR/FR", type: "nontech"))
            updateData(on: data)
//            presenter.fetchNonTechCircles()
        }
    }
}
