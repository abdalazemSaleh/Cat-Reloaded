//
//  ErrorMessages.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-10-03.
//

import Foundation

#warning("this messages from GitHub App don't forget. 👻")

enum GFError: String, Error {
    
    case invalidUsername    = "This username created an invalid request. Please try again."
    case unableToComplete   = "Unable to complete your request. Please check your internet connection"
    case invalidResponse    = "Invalid response from the server. Please try again."
    case invalidData        = "The data received from the server was invalid. Please try again."
    case unableToFavorite   = "There was an error favoriting this user. Please try agine later."
    case alreadyInFavorites = "This user is already in favorite list."
    
}
