//
//  CircleHeader.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-11-15.
//

import UIKit

class CircleHeader: SegmentView {
    static let reuseIdentifer = "CircleHeader"
    
    var delegate: checkSelectedIndex?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        segmentButtons = ["Technical Circles", "Non-Technical Circles"]
        configure()
        segmentView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CircleHeader: CustomSegmentedControlDelegate {
    func change(to index: Int) {
        delegate?.checkIndex(index)
    }
}
