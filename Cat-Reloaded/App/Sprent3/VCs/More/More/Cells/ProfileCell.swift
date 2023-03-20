//
//  ProfileCell.swift
//  Cat-Reloaded
//
//  Created by Omar Tharwat on 11/12/2022.
//

import UIKit

class ProfileCell : GFSimpleCell {
    // MARK: - Variables
    static let reuseIdentifer   = "ProfileCell"

    // MARK: - Initilaizer
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Set function
    func set(model: CATianModel) {
        rowImage.image  = model.image
        labelCell.text  = model.name
    }
}
