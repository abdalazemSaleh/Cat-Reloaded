//
//  ParsingJson.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-10-29.
//

import Foundation

class ParsJson {
    static let shared = ParsJson()
    func parsJson<T: Codable>(modal: T.Type, data: Data, completion: @escaping (ServerResponse<T>) -> Void) {
        do {
            let info = try JSONDecoder().decode(T.self, from: data)
            completion(.success(info))
        } catch let jsonerror {
            print(jsonerror.localizedDescription)
        }
    }
}
