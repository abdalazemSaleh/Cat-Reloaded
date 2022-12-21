//
//  Home+Constarint.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-10-11.
//

import UIKit

extension HomeVC {
    func configureUI() {
        configureScrollView()
        configureContentView()
        addItemViewToContentView()
        configureSharedConstraint()
        welcomeCardConstraint()
        aboutCatCardConstraint()
    }
    
    // Configure Scroll View
    func configureScrollView() {
        scrollView = UIScrollView(frame: .zero)
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    // Configure content view
    func configureContentView() {
        contentView = UIView(frame: .zero)
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        let heightConstraint = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        heightConstraint.priority = UILayoutPriority(250)

        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            heightConstraint,
        ])
    }
    
    // Add items to content view
    func addItemViewToContentView() {
        itemViews   = [welcomeCardStack, aboutCatCardStack]
        for itemView in itemViews {
            contentView.addSubview(itemView)
        }
    }
    
    func configureSharedConstraint() {
        sharedView = [welcomeCardStack, aboutCatCardStack]
        for itemView in sharedView {
            NSLayoutConstraint.activate([
                itemView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
                itemView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
            ])
        }
    }
    
    func welcomeCardConstraint() {
        welcomeCardTitle.textColor      = Colors.mainColor
        welcomeCardTitle.text           = "Welcome Abdalazem"
        
        welcomeCardStack.axis           = .vertical
        welcomeCardStack.spacing        = 8
        
        welcomeCardStack.addArrangedSubview(welcomeCardTitle)
        welcomeCardStack.addArrangedSubview(welcomeCard)
        
        welcomeCardStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            welcomeCardStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            welcomeCard.heightAnchor.constraint(equalToConstant: 140)
        ])
    }
    
    func aboutCatCardConstraint() {
        aboutCatTitle.textColor     = Colors.mainColor
        aboutCatTitle.text          = "About CAT"
        
        aboutCatCardStack.axis      = .vertical
        aboutCatCardStack.spacing   = 8
        
        aboutCatCardStack.addArrangedSubview(aboutCatTitle)
        aboutCatCardStack.addArrangedSubview(aboutCatCard)
        
        aboutCatCardStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            aboutCatCardStack.topAnchor.constraint(equalTo: welcomeCardStack.bottomAnchor, constant: padding),
            aboutCatCard.heightAnchor.constraint(equalToConstant: 140)
        ])
    }
    
    func configureCollectionViewConstraint() {
        contentView.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: aboutCatCardStack.bottomAnchor, constant: padding),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 500),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding)
        ])
    }
}
