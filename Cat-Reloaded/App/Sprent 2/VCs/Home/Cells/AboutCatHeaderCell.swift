//
//  AboutCatHeaderCell.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-12-31.
//

import UIKit

class AboutCatHeaderCell: UICollectionViewCell {
    // MARK: - Variables
    static let reuseIdentifer   = "CollectionViewHeaderCell"
    
    let catImage                = GFImageView(frame: .zero)
    
    let aboutCatLabel           = GFTitleLabel(textAlignment: .left, fontSize: 24, weight: .bold)
    let aboutCatDescrption      = GFTextView(textAlignment: .left, fontSize: 14, weight: .regular)
    
    let ourHistoryLabel         = GFTitleLabel(textAlignment: .left, fontSize: 24, weight: .bold)
    let ourHistoryDescrption    = GFTextView(textAlignment: .left, fontSize: 14, weight: .regular)

    let ourMissionLabel         = GFTitleLabel(textAlignment: .left, fontSize: 24, weight: .bold)
    let ourMissionDescrption    = GFTextView(textAlignment: .left, fontSize: 14, weight: .regular)
    
    let padding: CGFloat        = 20
    
    var views: [UIView]         = []
    
    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(model: AboutCatInfoModel) {
        aboutCatDescrption.text     = model.about
        ourHistoryDescrption.text   = model.history
        ourMissionDescrption.text   = model.vision
    }
}


extension AboutCatHeaderCell {
    private func configure() {
        addSubViewsToCircleDetailsHeader()
        circleDetailsHeaderConstraint()
    }
}

extension AboutCatHeaderCell {
    private func addSubViewsToCircleDetailsHeader() {
        views = [catImage, aboutCatLabel, aboutCatDescrption, ourHistoryLabel, ourHistoryDescrption, ourMissionLabel, ourMissionDescrption]
        for view in views {
            addSubview(view)
        }
    }
}

extension AboutCatHeaderCell {
    private func circleDetailsHeaderConstraint() {
        catImageConstraint()
        aboutCatLableConstraint()
        aboutCatDescrptionConstraint()
        ourHistoryLableConstraint()
        ourHistoryDescrptionConstraint()
        ourMissionLabelConstraint()
        ourMissionDescrptionConstraint()
        sharedConstraint()
    }
    
    private func catImageConstraint() {
        catImage.contentMode = .scaleAspectFit
        catImage.image       = UIImage(named: "graphic")
        NSLayoutConstraint.activate([
            catImage.topAnchor.constraint(equalTo: topAnchor),
            catImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            catImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            catImage.heightAnchor.constraint(equalToConstant: 240)
        ])
    }
    
    private func aboutCatLableConstraint() {
        aboutCatLabel.textColor    = Colors.mainColor
        aboutCatLabel.text         = "About CAT Reloded"
        NSLayoutConstraint.activate([
            aboutCatLabel.topAnchor.constraint(equalTo: catImage.bottomAnchor, constant: padding),
        ])
    }
    
    private func aboutCatDescrptionConstraint() {
        NSLayoutConstraint.activate([
            aboutCatDescrption.topAnchor.constraint(equalTo: aboutCatLabel.bottomAnchor, constant: padding),
        ])
    }
    
    private func ourHistoryLableConstraint() {
        ourHistoryLabel.textColor    = Colors.mainColor
        ourHistoryLabel.text         = "Our history"
        NSLayoutConstraint.activate([
            ourHistoryLabel.topAnchor.constraint(equalTo: aboutCatDescrption.bottomAnchor, constant: padding),
        ])
    }
    
    private func ourHistoryDescrptionConstraint() {
        NSLayoutConstraint.activate([
            ourHistoryDescrption.topAnchor.constraint(equalTo: ourHistoryLabel.bottomAnchor, constant: padding),
        ])
    }
    
    private func ourMissionLabelConstraint() {
        ourMissionLabel.textColor    = Colors.mainColor
        ourMissionLabel.text         = "Our Mission & Vision"
        NSLayoutConstraint.activate([
            ourMissionLabel.topAnchor.constraint(equalTo: ourHistoryDescrption.bottomAnchor, constant: padding),
        ])
    }
    
    private func ourMissionDescrptionConstraint() {
        NSLayoutConstraint.activate([
            ourMissionDescrption.topAnchor.constraint(equalTo: ourMissionLabel.bottomAnchor, constant: padding),
        ])
    }
    
    private func sharedConstraint() {
        views = [aboutCatLabel, aboutCatDescrption, ourHistoryLabel, ourHistoryDescrption, ourMissionLabel, ourMissionDescrption]
        for view in views {
            NSLayoutConstraint.activate([
                view.leadingAnchor.constraint(equalTo: leadingAnchor),
                view.trailingAnchor.constraint(equalTo: trailingAnchor),
            ])
        }
    }
}
