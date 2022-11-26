//
//  CircleHeader.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-11-15.
//

import UIKit

protocol checkCirclesType {
    func checkIndex(_ index: Int)
}

class CircleHeader: UICollectionReusableView {
    static let reuseIdentifer = "CircleHeader"

    let SegmentView = CustomSegmentedControl()
    var delegate: checkCirclesType?

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        SegmentView.delegate = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure() {
        SegmentView.setButtonTitles(buttonTitles: ["Technical Circles", "Non-Technical Circles"])
        SegmentView.selectorViewColor = Colors.mainColor ?? .systemRed
        SegmentView.selectorTextColor = .label

        let codeSegmented = CustomSegmentedControl(frame: .zero, buttonTitle: ["Technical Circles", "Non-Technical Circles"])
        codeSegmented.backgroundColor = .green

        addSubview(SegmentView)

        SegmentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            SegmentView.topAnchor.constraint(equalTo: topAnchor),
            SegmentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            SegmentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            SegmentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

    }

    @objc func clickMe() {
        print("Hello World")
    }
}

extension CircleHeader: CustomSegmentedControlDelegate {
    func change(to index: Int) {
        print("Selected index :- (index)")
        delegate?.checkIndex(index)
    }
}
