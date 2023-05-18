//
//  SegmentView.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2023-02-04.
//

import UIKit

protocol checkSelectedIndex {
    func checkIndex(_ index: Int)
}

class SegmentView: UICollectionReusableView {
    // MARK: - Variables
    var segmentButtons: [String]  = ["Test", "Test2"]
    let segmentView               = CustomSegmentedControl()
    
    // MARK: - Initilizer
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configure function
    func configure() {
        segmentView.setButtonTitles(buttonTitles: segmentButtons)
        segmentView.selectorViewColor = Colors.mainColor ?? .systemRed
        segmentView.selectorTextColor = .label
        
        let codeSegmented = CustomSegmentedControl(frame: .zero, buttonTitle: segmentButtons)
        codeSegmented.backgroundColor = .green
        
        addSubview(segmentView)
        
        segmentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            segmentView.topAnchor.constraint(equalTo: topAnchor),
            segmentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            segmentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            segmentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
