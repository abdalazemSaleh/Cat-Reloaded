//
//  GFPageControl.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-10-05.
//

import UIKit

class GFPageControl: UIPageControl {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor                 = .systemBackground
        pageIndicatorTintColor          = .systemGray4
        currentPageIndicatorTintColor   = Colors.mainColor
    }
    
}
