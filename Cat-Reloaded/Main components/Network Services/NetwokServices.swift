//
//  NetwokServices.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2023-05-19.
//

import Foundation

protocol NetworkServices {
    func request(endPoint: EndPoint) async throws -> Data
}

extension NetworkServices {
    func request(endPoint: EndPoint) async throws -> Data {
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
            
            if let jsonString = String(data: data, encoding: .utf8) {
               print(jsonString)
            }

            // Check connection, response, and response type
            guard Connectivity.isConnectedToInternet else { throw GFError.connectionError }
            guard let response = response as? HTTPURLResponse else { throw GFError.invalidResponse }
            let statusCode = response.statusCode
            switch statusCode {
            case 200...299:
                return data
            case 401:
                throw GFError.invalidData
            default:
                throw GFError.UnKnownError
            }
        } catch {
            throw error
        }
    }
}
