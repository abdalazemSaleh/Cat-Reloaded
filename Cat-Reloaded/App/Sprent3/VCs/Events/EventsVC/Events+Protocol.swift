//
//  Events+Protocol.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2023-02-04.
//

import UIKit

extension EventsVC: EventsView {
    func getUpComingEvents(data: [EventModel]) {
        emptyView.removeFromSuperview()
        self.data.removeAll()
        self.data = data
        if data.isEmpty {
            updateData(on: [.init(id: "NoData", name: "", description: "", url: "", imageUrl: "", startDate: "", upcoming: false)])
            presentEmptyView(message: "No data to show", image: Images.noData!)
        } else {
            updateData(on: data)
        }
    }
    
    func getPreviousEvents(data: [EventModel]) {
        emptyView.removeFromSuperview()
        self.data.removeAll()
        self.data = data
        updateData(on: data)
    }
        
    func presentEmptyView(message: String, image: UIImage) {
        let image = Images.noData
        emptyView.image = image
        emptyView.contentMode = .scaleAspectFit
        let padding = view.frame.height / 4
        collectionView.addSubview(emptyView)
        emptyView.makeConstraints(topAnchor: view.topAnchor, bottomAnchor: view.bottomAnchor, leadingAnchor: view.leadingAnchor, trailingAnchor: view.trailingAnchor, padding: UIEdgeInsets(top: padding, left: 0, bottom: padding, right: 0))
    }
}

extension EventsVC: checkSelectedIndex {
    func checkIndex(_ index: Int) {
        if index == 0 {
            self.data.removeAll()
            presenter.fetchUpComingEvents()
        } else {
            self.data.removeAll()
            presenter.fetchpreviousEvents()
        }
    }
}
