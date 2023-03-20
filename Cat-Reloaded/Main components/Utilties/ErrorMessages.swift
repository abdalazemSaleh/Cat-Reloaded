//
//  ErrorMessages.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-10-03.
//

import Foundation

#warning("this messages from GitHub App don't forget. 👻")

enum GFError: String, Error {
    case connectionError    = "No internet connection."
    case invalidUsername    = "This username created an invalid request. Please try again."
    case unableToComplete   = "Unable to complete your request. Please check your internet connection"
    case invalidResponse    = "Data is missing. please check your data."
    case invalidData        = "Wrong phone number or password. Please try again."
    case unableToFavorite   = "There was an error favoriting this user. Please try agine later."
    case alreadyInFavorites = "This user is already in favorite list."
    
}
