//
//  NetworkManger.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-10-29.
//

import Foundation
import Alamofire

#warning("Move enum to another file")
enum HTTPStatusCode: Int, Error {
    case ok                     = 200
    case badRequest             = 400
    case notAuthorized          = 401
    case forbidden              = 402
    case notFound               = 404
    case DataInvalid            = 422
    case internalServerError    = 500
    case badGateway             = 502
}


struct NetworkManger {
    
    let url: String
    let method: HTTPMethod
    let parms: [String: Any]?
    let header: [String: Any]?
            
    func request<T: Codable>(modal: T.Type, completion: @escaping (ServerResponse<T>) -> Void) {
        
        let url = URLs.baseURL.rawValue + url
                
        Alamofire.request(url, method: method, parameters: parms, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            guard let statusCode = response.response?.statusCode else { return }
            print(statusCode)
            guard let responseType: HTTPStatusCode = HTTPStatusCode(rawValue: statusCode) else {
                return completion(.failure(GFError.invalidResponse))
            }
            switch responseType {
            case .ok:
                guard let data = response.data else { return }
                ParsJson.shared.parsJson(modal: modal, data: data) { result in
                    switch result {
                    case .success(let userInfo):
                        completion(.success(userInfo))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
            #warning("don't forget Return error message with completion")
            case .badRequest:
                completion(.failure(.alreadyInFavorites))
            case .notAuthorized:
                completion(.failure(.invalidData))
            case .forbidden:
                completion(.failure(.unableToFavorite))
            case .notFound:
                print("NotFound")
            case .DataInvalid:
                print("Data invalid")
            case .internalServerError:
                print("internalServerError")
            case .badGateway:
                print("badGateway")
            }
        }
    }
}


enum ServerResponse<T> {
    case success(T), failure(GFError)
}

#warning("Move parsJson to another file")
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
