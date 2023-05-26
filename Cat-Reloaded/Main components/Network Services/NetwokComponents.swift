//
//  EndPoint.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2023-05-19.
//

import Foundation

protocol EndPoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: HTTPMethodd { get }
    var header: [String: String]? { get }
    var body: [String: Any]? { get }
}

extension EndPoint {
    var scheme: String {
        return "https"
    }
    
    var host: String {
        return "api.catreloaded.org"
    }
}

enum HTTPMethodd {
    case get
    case post
    var method: String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        }
    }
}

enum HTTPStatusCode: Int, Error {
    case ok                     = 200
    case done                   = 204
    case badRequest             = 400
    case notAuthorized          = 401
    case forbidden              = 402
    case notFound               = 404
    case DataInvalid            = 422
    case internalServerError    = 500
    case badGateway             = 502    
}
