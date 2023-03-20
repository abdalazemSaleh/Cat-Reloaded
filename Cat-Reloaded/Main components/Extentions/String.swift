//
//  String.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2023-02-05.
//

import Foundation

extension String {
    var asURL: URL? {
        return URL(string: self)
    }
    
    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let inputDate = dateFormatter.date(from: self) ?? Date()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: inputDate)
    }
}
