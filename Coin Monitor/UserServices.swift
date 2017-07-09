//
//  UserServices.swift
//  Coin Monitor
//
//  Created by iovomod on 09/07/2017.
//  Copyright © 2017 Semerikov Sergey. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import RealmSwift

class UserServices {
    
    typealias DownloadUsersCompletion = () -> Void
    
    func downloadUsers(completion: @escaping DownloadUsersCompletion ) {
        
        Alamofire.request(Router.getUsers()).responseJSON { [weak self] response in
            switch response.result {
            case .success(let rawJson):
                self?.parseUsersFromJson(rawJson: rawJson)
                completion()
            case .failure(let error): print(error)
            }
        }
    }
    
    private func parseUsersFromJson(rawJson: Any) {
        let json = JSON(rawJson)
        var users = [User]()
        var companyes = [Company]()
        
        for (_, subJson) in json {
            let user = User(json: subJson)
            if let user = user {
                users.append(user)
            }
            if let company = Company(json: subJson, user: user) {
                companyes.append(company)
            }
        }
        saveUsers(users: users, companyes: companyes)
    }
    
    private func saveUsers(users: [User], companyes: [Company]) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(users)
                realm.add(companyes)
            }
        } catch {
            debugPrint(error)
        }
    }
    
    func getUsers() -> [User] {
        do {
            let realm = try Realm()
            let users = realm.objects(User.self)
            return Array(users)
        } catch {
            debugPrint(error)
            return []
        }
    }
    
    func getCompanyes() -> [Company] {
        do {
            let realm = try Realm()
            let companyes = realm.objects(Company.self)
            return Array(companyes)
        } catch {
            debugPrint(error)
            return []
        }
    }
}
