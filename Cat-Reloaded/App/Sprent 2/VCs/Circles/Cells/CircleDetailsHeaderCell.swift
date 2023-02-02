//
//  CircleDetailsHeaderCell.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-12-13.
//

import UIKit

class CircleDetailsHeaderCell: UICollectionViewCell {
    // MARK: - Variables
    static let reuseIdentifer = "CollectionViewHeaderCell"
    
    let circleImage             = GFImageView(frame: .zero)
    let circleName              = GFTitleLabel(textAlignment: .left, fontSize: 24, weight: .bold)
    let circleDescrption        = GFTextView(textAlignment: .left, fontSize: 14, weight: .regular)
    
    let roadMapButton           = GFButton(title: "Road map")
    var roadMapUrl              = ""
    
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
}

extension CircleDetailsHeaderCell {
    private func configure() {
        addSubViewsToCircleDetailsHeader()
        circleDetailsHeaderConstraint()
    }
}

extension CircleDetailsHeaderCell {
    private func addSubViewsToCircleDetailsHeader() {
        views = [circleImage, circleName, circleDescrption, roadMapButton]
        for view in views {
            addSubview(view)
        }
    }
}

extension CircleDetailsHeaderCell {
    private func circleDetailsHeaderConstraint() {
        circleImageConstraint()
        circleNameConstraint()
        circleDescrptionConstraint()
        roadMapConstraint()
        sharedConstraint()
    }
    
    private func circleImageConstraint() {
        circleImage.contentMode = .scaleAspectFit
        circleImage.image       = UIImage(named: "graphic")
        NSLayoutConstraint.activate([
            circleImage.topAnchor.constraint(equalTo: topAnchor),
            circleImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            circleImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            circleImage.heightAnchor.constraint(equalToConstant: 240)
        ])
    }
    
    private func circleNameConstraint() {
        circleName.textColor    = Colors.mainColor
        circleName.text         = "iOS Circle"
        NSLayoutConstraint.activate([
            circleName.topAnchor.constraint(equalTo: circleImage.bottomAnchor, constant: padding),
        ])
    }
    
    private func circleDescrptionConstraint() {
        circleDescrption.text   = "Have you ever seen a picture and kept thinking, How was this design made?What is the idea of this design ? How much does he develop himself to reach this level ? This makes us know graphic design, which is a visual contact the graphic designer communicates certain ideas or messages in a visual way.These visuals can be as simple as a business logo, or as complex as page layouts, via programs like Photoshop, illustrator, XD that help him control images, fonts, colors, shapes and sizes."
        NSLayoutConstraint.activate([
            circleDescrption.topAnchor.constraint(equalTo: circleName.bottomAnchor, constant: padding),
        ])
    }
    
    private func roadMapConstraint() {
        NSLayoutConstraint.activate([
            roadMapButton.topAnchor.constraint(equalTo: circleDescrption.bottomAnchor, constant: 48),
            roadMapButton.heightAnchor.constraint(equalToConstant: 48),
            roadMapButton.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func sharedConstraint() {
        views = [circleName, circleDescrption, roadMapButton]
        for view in views {
            NSLayoutConstraint.activate([
                view.leadingAnchor.constraint(equalTo: leadingAnchor),
                view.trailingAnchor.constraint(equalTo: trailingAnchor),
            ])
        }
    }
}

// MARK: - Set function
extension CircleDetailsHeaderCell {
    func set(model: CircleDetailsModel, image: String) {
        circleImage.image = UIImage(named: image)
        roadMapUrl = model.roadmapUrl ?? ""
        roadMapButton.addTarget(CircleDetailsVC(), action: #selector(openUrl), for: .touchUpInside)
        circleName.text         = model.name
        circleDescrption.text   = model.description
    }
    @objc private func openUrl() {
        if let url = URL(string: roadMapUrl) {
            UIApplication.shared.open(url)
        }
    }
}
