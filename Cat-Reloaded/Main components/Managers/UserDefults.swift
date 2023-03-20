//
//  UserDefults.swift
//  Cat-Reloaded
//
//  Created by Abdalazem Saleh on 2022-11-30.
//

import Foundation
import Alamofire

var userKey = "UserKey"

struct UserData {
    static func chacheUserModel(user: UserInfo) ->Void {
        let userData = try! user.asDictionary()
        UserDefaults.standard.set(userData, forKey: userKey)
    }
    
    static func getUserModel() -> UserInfo? {
        if let cachedData = UserDefaults.standard.object(forKey: userKey) as? [String: Any]{
            let data = try! JSONSerialization.data(withJSONObject: cachedData, options: .prettyPrinted)
            let decoder = JSONDecoder()
            do{
                let user = try decoder.decode(UserInfo.self, from: data)
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
    
    static func fetchUserInfo(completion: @escaping (ServerResponse<UserInfo>) -> Void) {
        let token = UserDefaults.standard.string(forKey: "UserToken") ?? ""
        let header: HTTPHeaders = [
            "Authorization": "Bearer " + token,
        ]
        let fetchUserInfo = NetworkManger(url:"/user/info", method: .get, parms: nil, header: header)
        fetchUserInfo.request(modal: UserInfo.self) {  response in
            switch response {
            case .success(let user):
                UserDefaults.standard.set(true, forKey: "UserLogin")
                UserData.chacheUserModel(user: user)
                completion(.success(user))
            case .failure(_):
                UserDefaults.standard.set(false, forKey: "UserLogin")
                completion(.failure(.invalidData))
            }
        }
    }
}
