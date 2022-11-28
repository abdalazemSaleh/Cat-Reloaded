//
//  BoardingVC.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-10-05.
//

import UIKit

class BoardingVC: UIViewController {
    
    // MARK: - Variables
    var collectionView: UICollectionView!
    let skipButton                  = GFSimpleButton(title: "Skip", titleColor: .label)
    let nextButton                  = GFSimpleButton(title: "Next", titleColor: Colors.mainColor!)
    let previousButton              = GFSimpleButton(title: "Previous", titleColor: .label)
        
    let padding: CGFloat            = 20
    var slides: [OnboardingSlide]   = []
    var currenPage                  = 0 {
        didSet {
            handelCurrentPage()
        }
    }
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        if UserDefaults.standard.object(forKey: "isFirstTime") != nil {
            skipButtonClicked()
        } else {
            UserDefaults.standard.set("True", forKey: "isFirstTime")
        }
        addSlide()
        configureUI()
        configureCollectionView()
        configureButtonsAction()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
        
    // MARK: - Configure functions
    func configureUI() {
        view.addSubview(skipButton)
        view.addSubview(nextButton)
        view.addSubview(previousButton)
        
        NSLayoutConstraint.activate([
            skipButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            skipButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -padding),
            
            previousButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            previousButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -padding)
        ])
    }
    
    func configureCollectionView() {
        collectionView  = UICollectionView(frame: .zero, collectionViewLayout: HelperUI.collectionViewFlowLayout(in: view))
        view.addSubview(collectionView)
        
        collectionView.register( BoardingCell.self, forCellWithReuseIdentifier: BoardingCell.cellID)
        
        collectionView.delegate                                     = self
        collectionView.dataSource                                   = self
        
        collectionView.isScrollEnabled                              = false
        collectionView.isPagingEnabled                              = true
        collectionView.showsHorizontalScrollIndicator               = false
        collectionView.showsVerticalScrollIndicator                 = false
        collectionView.translatesAutoresizingMaskIntoConstraints    = false
        
        NSLayoutConstraint.activate([
            collectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 24),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 296)
        ])
    }
    
    func configureButtonsAction() {
        skipButton.addTarget(self, action: #selector(skipButtonClicked), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(nextButtonClicked), for: .touchUpInside)
        previousButton.addTarget(self, action: #selector(previousButtonClicked), for: .touchUpInside)
    }
    
    // MARK: - Functions
    func handelCurrentPage() {
        if currenPage == slides.count - 1 {
            nextButton.setTitle("Get started", for: .normal)
        } else {
            nextButton.setTitle("Next", for: .normal)
        }
    }
    
    func addSlide() {
        slides = [
            OnboardingSlide(description: "Your community to explore new worlds according your scope.", image: UIImage(named: "Group 7051")!),
            OnboardingSlide(description: "Catch your way in technical growth and non-technical field.", image: UIImage(named: "Multi-device targeting-pana")!),
            OnboardingSlide(description: "While you invest your role in CAT, You gain more exploring.", image: UIImage(named: "about-us")!)
        ]
    }
    
    @objc func skipButtonClicked() {
        let vc = LoginVC()
        nav(vc: vc)
    }
    
    @objc func nextButtonClicked() {
        if currenPage == slides.count - 1 {
            // go to home screen
            nav(vc: LoginVC())
        } else {
            currenPage += 1
            let indexPath = IndexPath(item: currenPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
    @objc func previousButtonClicked() {
        currenPage -= 1
        let indexPath = IndexPath(item: currenPage, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
}
