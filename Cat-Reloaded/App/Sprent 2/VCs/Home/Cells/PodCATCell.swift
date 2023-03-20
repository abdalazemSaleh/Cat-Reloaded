//
//  PodCATCell.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-10-13.
//

import UIKit

class PodCATCell: ImageContainerCell {
    
    // MARK: - Variables
    static let reuseIdentifer               = "podCATCell"
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set function
    func set(_ podCats: PodCatData) {
        indicator.startAnimating()
        ImageDownloader(urlString: podCats.thumbnailUrl).downloadImage { image in
            DispatchQueue.main.async {
                self.indicator.removeFromSuperview()
                self.imageView.image = image
            }
        }
    }
}
