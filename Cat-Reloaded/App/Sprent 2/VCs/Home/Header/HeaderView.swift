//
//  HeaderView.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-10-17.
//

import UIKit

class HeaderView: UICollectionReusableView {
    static let reuseIdentifier = "HeaderView"

    let label = UILabel()

    override init(frame: CGRect) {
      super.init(frame: frame)
      configure()
    }

    required init?(coder: NSCoder) {
      fatalError()
    }
  }

  extension HeaderView {
    func configure() {
      backgroundColor = .systemBackground

      addSubview(label)
      label.textColor = Colors.mainColor
      label.translatesAutoresizingMaskIntoConstraints = false

      let inset = CGFloat(10)
      NSLayoutConstraint.activate([
        label.leadingAnchor.constraint(equalTo: leadingAnchor),
        label.trailingAnchor.constraint(equalTo: trailingAnchor),
        label.topAnchor.constraint(equalTo: topAnchor, constant: inset),
        label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -inset)
      ])
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
    }
  }

