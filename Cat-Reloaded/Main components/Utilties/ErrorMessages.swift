//
//  ErrorMessages.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-10-03.
//

import Foundation

#warning("this messages from GitHub App don't forget. 👻")

enum GFError: Error, LocalizedError {
    case invalidUrl
    case connectionError
    case invalidUsername
    case unableToComplete
    case invalidResponse
    case invalidData
    case unableToFavorite
    case alreadyInFavorites
    case UnKnownError
    
    var errorDescription: String? {
        switch self {
        case .invalidUrl:
            return NSLocalizedString("Woops, invalid URL Please try agine later.", comment: "")
        case .connectionError:
            return NSLocalizedString("Woops, No internet connection.", comment: "")
        case .invalidUsername:
            return NSLocalizedString("Woops, This username created an invalid request. Please try again.", comment: "")
        case .unableToComplete:
            return NSLocalizedString("Woops, Unable to complete your request. Please check your internet connection", comment: "")
        case .invalidResponse:
            return NSLocalizedString("Woops, Data is missing, please check your data.", comment: "")
        case .invalidData:
            return NSLocalizedString("Woops, Wrong phone number or password. Please try again.", comment: "")
        case .unableToFavorite:
            return NSLocalizedString("Woops, There was an error favoriting this user. Please try agine later.", comment: "")
        case .alreadyInFavorites:
            return NSLocalizedString("Woops, This user is already in favorite list.", comment: "")
        case .UnKnownError:
            return NSLocalizedString("Unrecognized error please try again later.", comment: "")
        }
    }
}
