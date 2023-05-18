//
//  EventsPresenter.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2023-02-14.
//

import UIKit

protocol EventsView: AnyObject {
    func getUpComingEvents(data: [EventModel])
    func getPreviousEvents(data: [EventModel])
    func presentEmptyView(message: String, image: UIImage)
}

class EventsPresenter {
    // about init & delegation
    private weak var view: EventsView?
    init(view: EventsView) {
        self.view = view
    }
    // code
    func fetchUpComingEvents() {
        let url = URLs.upComingEvents.rawValue
        let upComingEventsObject = NetworkManger(url: url, method: .get, parms: nil, header: nil)
        upComingEventsObject.request(modal: [EventModel].self) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.view?.getUpComingEvents(data: data)
            case .failure(let error):
                if error == .connectionError {
                    self.view?.presentEmptyView(message: error.localizedDescription, image: Images.networkError!)
                } else {
                    self.view?.presentEmptyView(message: error.localizedDescription, image: Images.serverError!)
                }
            }
        }
    }
    
    func fetchpreviousEvents() {
        let url = URLs.previousEvents.rawValue
        let upComingEventsObject = NetworkManger(url: url, method: .get, parms: nil, header: nil)
        upComingEventsObject.request(modal: [EventModel].self) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.view?.getPreviousEvents(data: data)
            case .failure(let error):
                if error == .connectionError {
                    self.view?.presentEmptyView(message: error.localizedDescription, image: Images.networkError!)
                } else {
                    self.view?.presentEmptyView(message: error.localizedDescription, image: Images.serverError!)
                }
            }
        }
    }
}
