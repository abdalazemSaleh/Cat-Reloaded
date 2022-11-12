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

class NetworkManger {
    static let shared = NetworkManger()
    
    func request<T: Codable>(modal: T.Type, url: String, method: HTTPMethod, parms: [String:Any], header: [String:Any]?, completion: @escaping (ServerResponse<T>) -> Void) {
        let url = URLs.baseURL.rawValue + url
        
        Alamofire.request(url, method: method, parameters: parms, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            guard let statusCode = response.response?.statusCode else { return }
            
            guard let responseType: HTTPStatusCode = HTTPStatusCode(rawValue: statusCode) else {
                return completion(.failure(GFErro.invalidResponse))
            }
            switch responseType {
            case .ok:
                guard let data = response.data else { return }
//                do {
//                    let info = try JSONDecoder().decode(T.self, from: data)
//                    completion(.success(info))
//                } catch let jsonerror {
//                    print(jsonerror.localizedDescription)
//                }
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
                print("BadReques")
            case .notAuthorized:
                print("NoAuth")
            case .forbidden:
                print("Forbidden")
            case .notFound:
                print("NotFound")
            case .DataInvalid:
                print("Data invalid")
            case .internalServerError:
                print("internalServerError")
            case .badGateway:
                print("badGateway")
            }
            
            //            print("Status Code: - \(statusCode)")
            //            guard let data = response.data else { return }
            //            do {
            //                let info = try JSONDecoder().decode(T.self, from: data)
            //                completion(.success(info))
            //            } catch let jsonerror {
            //                print(jsonerror.localizedDescription)
            //            }
            
        }
    }
}

enum ServerResponse<T> {
    case success(T), failure(Error?)
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
