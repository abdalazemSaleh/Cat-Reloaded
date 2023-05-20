//
//  NetwokServices.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2023-05-19.
//

import Foundation

protocol NetworkServices {
    func request<T: Codable>(endPoint: EndPoint, model: T.Type) async throws -> T
}

extension NetworkServices {
    func request<T: Codable>(endPoint: EndPoint, model: T.Type) async throws -> T {
        // URL Components
        var urlComponents = URLComponents()
        urlComponents.scheme = endPoint.scheme
        urlComponents.host = endPoint.host
        urlComponents.path = endPoint.path
        guard let url = urlComponents.url else { throw GFError.invalidUrl }
        
        do {
            // Request
            var request = URLRequest(url: url)
            request.timeoutInterval = 30
            request.httpMethod = endPoint.method.method
            if let parms = endPoint.body {
                request.httpBody = try JSONSerialization.data(withJSONObject: parms)
            }
            if let header = endPoint.header {
                request.allHTTPHeaderFields = header
            }
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            // Start session
            let (data, response) = try await URLSession.shared.data(for: request)
            
            // Check connection, response, and response type
            guard Connectivity.isConnectedToInternet else { throw GFError.connectionError }
            guard let response = response as? HTTPURLResponse else { throw GFError.invalidResponse }
            guard let responseType: HTTPStatusCode = HTTPStatusCode(rawValue: response.statusCode) else {
                throw GFError.invalidResponse
            }
            
            // Work with reponse state
            switch responseType {
            case .ok:
                do {
                    let info = try JSONDecoder().decode(T.self, from: data)
                    return info
                } catch {
                    throw error
                }
            case .badRequest:
                throw GFError.alreadyInFavorites
            case .notAuthorized:
                throw GFError.alreadyInFavorites
            case .forbidden:
                throw GFError.alreadyInFavorites
            case .notFound:
                throw GFError.alreadyInFavorites
            case .DataInvalid:
                throw GFError.invalidData
            case .internalServerError:
                throw GFError.alreadyInFavorites
            case .badGateway:
                throw GFError.alreadyInFavorites
            }
        } catch {
            print(error.localizedDescription)
            throw error
        }
    }
}
