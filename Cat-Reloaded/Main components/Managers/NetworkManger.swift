//
//  NetworkManger.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-10-29.
//

import Alamofire
import UIKit


struct Connectivity {
    static let sharedInstance = NetworkReachabilityManager()!
    static var isConnectedToInternet:Bool {
        return self.sharedInstance.isReachable
    }
}

struct NetworkManger {
    
    let url: String
    let method: HTTPMethod
    let parms: [String: Any]?
    let header: HTTPHeaders?
    
    func request<T: Codable>(modal: T.Type, completion: @escaping (ServerResponse<T>) -> Void) {
        
        let url = URLs.baseURL.rawValue + url
        
        AF.request(url,
                   method: method,
                   parameters: parms,
                   encoding: JSONEncoding.default,
                   headers: header).response { response in
            guard Connectivity.isConnectedToInternet else { return completion(.failure(GFError.connectionError)) }
            
            guard let statusCode = response.response?.statusCode else { return }
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
                completion(.failure(.invalidResponse))
            case .DataInvalid:
                completion(.failure(.invalidResponse))
            case .internalServerError:
                completion(.failure(.invalidResponse))
            case .badGateway:
                completion(.failure(.invalidResponse))
            }
        }
    }
}

enum ServerResponse<T> {
    case success(T), failure(GFError)
}
