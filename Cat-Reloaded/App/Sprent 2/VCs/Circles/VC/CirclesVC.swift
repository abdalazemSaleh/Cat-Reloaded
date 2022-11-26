//
//  CirclesVC.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-10-11.
//

import UIKit

class CirclesVC: UIViewController, UICollectionViewDelegate {
    
    // MARK: - Vailables
    static let sectionHeaderElementKind = "section-header-element-kind"
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<CirclesSection, CirclesModel>!
    
    var tech: [CirclesModel] = []
    var nonTech: [CirclesModel] = []
    
    var myIndex: Int = 0
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationController()
        configureCollectionView()
        configureDataSource()
        appendData()
    }
    // MARK: - Functions
    func configureNavigationController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles  =   true
    }
    #warning("Remove later")
    func appendData() {
        tech.append(CirclesModel.init(circleName: "iOS", circleImage: "ios"))
        tech.append(CirclesModel.init(circleName: "Android", circleImage: "android"))
        tech.append(CirclesModel.init(circleName: "Flutter", circleImage: "flutter"))
        tech.append(CirclesModel.init(circleName: "UI/UX", circleImage: "ui"))
        tech.append(CirclesModel.init(circleName: "Front-End", circleImage: "front"))
        tech.append(CirclesModel.init(circleName: "Back-End", circleImage: "Back"))
        tech.append(CirclesModel.init(circleName: "Cyber Security", circleImage: "cyber"))
        tech.append(CirclesModel.init(circleName: "Data", circleImage: "data"))
        tech.append(CirclesModel.init(circleName: "Gaming", circleImage: "gaming"))
        
//        nonTech.append(CirclesModel.init(circleName: "HR", circleImage: "HR"))
//        nonTech.append(CirclesModel.init(circleName: "Logistics", circleImage: "Logistics"))
//        nonTech.append(CirclesModel.init(circleName: "Media", circleImage: "Media"))
//        nonTech.append(CirclesModel.init(circleName: "PR", circleImage: "PR"))
        
        nonTech.append(CirclesModel.init(circleName: "iOS", circleImage: "ios"))
        nonTech.append(CirclesModel.init(circleName: "UI/UX", circleImage: "ui"))
        nonTech.append(CirclesModel.init(circleName: "Data", circleImage: "data"))
        nonTech.append(CirclesModel.init(circleName: "Cyber Security", circleImage: "cyber"))
        nonTech.append(CirclesModel.init(circleName: "Gaming", circleImage: "gaming"))
        updateData(on: tech)
    }
}
