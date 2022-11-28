//
//  UserDefults.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-11-28.
//

import Foundation

var userKey = "UserKey"

struct UserData {
    static func chacheUserModel(user: ProfileModel) ->Void {
        let userData = try! user.asDictionary()
        UserDefaults.standard.set(userData, forKey: userKey)
    }
    
    static func getUserModel() -> ProfileModel? {
        if let cachedData = UserDefaults.standard.object(forKey: userKey) as? [String: Any]{
            let data = try! JSONSerialization.data(withJSONObject: cachedData, options: .prettyPrinted)
            let decoder = JSONDecoder()
            do{
                let user = try decoder.decode(ProfileModel.self, from: data)
                return user
            }catch{
                return nil
            }
        }
        return nil
    }
    
    static func resetDefaults() {
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: userKey)
        }
    }

}
