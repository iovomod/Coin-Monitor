//
//  Company.swift
//  Coin Monitor
//
//  Created by iovomod on 09/07/2017.
//  Copyright © 2017 Semerikov Sergey. All rights reserved.
//

import Foundation
import RealmSwift
import SwiftyJSON

class Company: Object {
    dynamic var name = ""
    let arrayUser = List<User>()
    
    convenience init?(json: JSON, user: User?) {
        guard let name = json ["company"]["name"].string else { return nil }
        self.init()
        self.name = name
        if let user = user {
           arrayUser.append(user)
        }
    }
}
