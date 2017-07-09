//
//  Router.swift
//  Coin Monitor
//
//  Created by iovomod on 09/07/2017.
//  Copyright © 2017 Semerikov Sergey. All rights reserved.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    
    private var basePath : String {
        return "https://jsonplaceholder.typicode.com"
    }
    
    case getUsers()
    
    private var path: String {
        switch self {
        case .getUsers: return "/users"
        }
    }
    
    private var method: HTTPMethod {
        switch self {
        case .getUsers: return .get
            
        }
    }
    
    private var parameters: Parameters {
        switch self {
        case .getUsers(): return [:]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try basePath.asURL()
        let urlRequest = URLRequest(url: url.appendingPathComponent(path))
        return try URLEncoding.default.encode(urlRequest, with: parameters)
    }
    
}
