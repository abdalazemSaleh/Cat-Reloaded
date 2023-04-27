//
//  EventsHeader.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2023-02-04.
//

import UIKit

class EventsHeader: SegmentView {
    
    static let reuseIdentifer = "EventsHeader"
    
    var delegate: checkSelectedIndex?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        segmentButtons = ["Upcoming Events", "Previous Events"]
        configure()
        segmentView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension EventsHeader: CustomSegmentedControlDelegate {
    func change(to index: Int) {
        delegate?.checkIndex(index)
    }
}

