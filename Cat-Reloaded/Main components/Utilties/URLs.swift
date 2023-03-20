//
//  URLs.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-10-29.
//

import Foundation

/// Main base url  https://catapp.hoscraft.cf

enum URLs: String {
    // Base URL
    case baseURL        = "http://129.151.251.150:2005"
    // URLs
    case login          = "/auth/signin/password"
    case sginup         = "/auth/signup/password"
    case external       = "/auth/signup/external"
    
    case podCat         = "/team/podcat"
    case memories       = "/team/memories"
    
    case info           = "/team/info"
    case founders       = "/team/founders"
    case teamBoard      = "/team/board"
    
    case techCircles    = "/circles/tech"
    case nonTechCircles = "/circles/nontech"
    
    case upComingEvents = "/events/upcoming"
    case previousEvents = "/events/previous"
    
    case userData       = "/user/info"
}
