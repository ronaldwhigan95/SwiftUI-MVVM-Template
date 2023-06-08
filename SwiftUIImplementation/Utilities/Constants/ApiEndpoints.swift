//
//  ApiEndpoints.swift
//  SwiftUIImplementation
//
//  Created by Ronald Chester Whigan on 5/9/23.
//

import Foundation

class ApiEndpoints {
    static let baseUrl = "https://dummyjson.com"
    
    enum Endpoints {
        case posts(limit: Int)
        case users(limit: Int)
        
        var url: String {
            switch self {
                //Not a good idea to load all users
            case .users (let limit):
                return "\(ApiEndpoints.baseUrl)/users?limit=\(limit)"
            case .posts (let limit):
                return "\(ApiEndpoints.baseUrl)/posts?limit=\(limit)"
            }
        }
    }
}
