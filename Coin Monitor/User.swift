//
//  User.swift
//  Coin Monitor
//
//  Created by iovomod on 09/07/2017.
//  Copyright © 2017 Semerikov Sergey. All rights reserved.
//

import Foundation
import RealmSwift
import SwiftyJSON

class User: Object {
    dynamic var name = ""
    dynamic var surename = ""
    
    convenience init?(json: JSON) {
        
        guard
            let name = json["name"].string,
            let surename = json["username"].string else {
                return nil
        }
        self.init()
        self.name = name
        self.surename = surename
    }
}
