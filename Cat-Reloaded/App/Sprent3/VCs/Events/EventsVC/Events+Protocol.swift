//
//  Events+Protocol.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2023-02-04.
//

import UIKit

extension EventsVC: EventsView {
    func getUpComingEvents(data: [EventModel]) {
        self.data.removeAll()
        self.data = data
        updateData(on: data)
    }
    
    func getPreviousEvents(data: [EventModel]) {
        self.data.removeAll()
        self.data = data
        updateData(on: data)
    }
        
    func presentEmptyView(message: String, image: UIImage) {
        print("OK")
    }
}

extension EventsVC: checkSelectedIndex {
    func checkIndex(_ index: Int) {
        if index == 0 {
            presenter.fetchUpComingEvents()
        } else {
            presenter.fetchpreviousEvents()
        }
    }
}
