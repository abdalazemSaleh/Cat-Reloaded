//
//  MemoriesCell.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-10-11.
//

import UIKit

class MemoriesCell: ImageContainerCell {
    
    // MARK: - Variables
    static let reuseIdentifer       = "MemoriesCell"
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set function
    func set(_ memories: MemoriesData) {
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(with: URL(string: memories.thumbnailUrl))
    }
}
