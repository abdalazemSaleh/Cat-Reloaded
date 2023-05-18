//
//  EventDetailsHeaderCell.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2023-02-06.
//

import UIKit

class EventDetailsHeaderCell: UICollectionViewCell {
    // MARK: - Variables
    static let reuseIdentifer = "CollectionViewHeaderCell"
    
    let eventImage             = GFImageView(frame: .zero)
    let indicator              = UIActivityIndicatorView()
    let eventName              = GFTitleLabel(textAlignment: .left, fontSize: 24, weight: .bold)
    let eventDate              = GFTitleLabel(textAlignment: .right, fontSize: 24, weight: .semibold)
    let eventDescrption        = GFTextView(textAlignment: .left, fontSize: 14, weight: .regular)
        
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

extension EventDetailsHeaderCell {
    private func configure() {
        addSubViewsToEventDetailsHeader()
        EventDetailsHeaderConstraint()
    }
}

extension EventDetailsHeaderCell {
    private func addSubViewsToEventDetailsHeader() {
        views = [eventImage, eventName, eventDate, eventDescrption]
        for view in views {
            addSubview(view)
        }
    }
}

extension EventDetailsHeaderCell {
    private func EventDetailsHeaderConstraint() {
        eventImageConstraint()
        configureIndicator()
        eventNameConstraint()
        eventDateConstraint()
        eventDescrptionConstraint()
        sharedConstraint()
    }
    
    private func eventImageConstraint() {
        eventImage.contentMode = .scaleAspectFill
        NSLayoutConstraint.activate([
            eventImage.topAnchor.constraint(equalTo: topAnchor),
            eventImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            eventImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            eventImage.heightAnchor.constraint(equalToConstant: 240)
        ])
    }
    
    private func configureIndicator() {
        contentView.addSubview(indicator)
        
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        indicator.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    private func eventNameConstraint() {
        eventName.textColor    = Colors.mainColor
        NSLayoutConstraint.activate([
            eventName.topAnchor.constraint(equalTo: eventImage.bottomAnchor, constant: padding),
            eventName.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
    
    private func eventDateConstraint() {
        NSLayoutConstraint.activate([
        eventDate.topAnchor.constraint(equalTo: eventImage.bottomAnchor, constant: padding),
        eventDate.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    private func eventDescrptionConstraint() {
        NSLayoutConstraint.activate([
            eventDescrption.topAnchor.constraint(equalTo: eventName.bottomAnchor, constant: padding),
        ])
    }
        
    private func sharedConstraint() {
        views = [eventDescrption]
        for view in views {
            NSLayoutConstraint.activate([
                view.leadingAnchor.constraint(equalTo: leadingAnchor),
                view.trailingAnchor.constraint(equalTo: trailingAnchor),
            ])
        }
    }
}

// MARK: - Set function
extension EventDetailsHeaderCell {
    func set(model: EventModel) {
        eventImage.kf.setImage(with: URL(string: model.imageUrl))
        eventImage.kf.indicatorType = .activity

        eventName.text         = model.name
        eventDate.text         = model.startDate.formattedDate
        eventDescrption.text   = model.description
    }
}

