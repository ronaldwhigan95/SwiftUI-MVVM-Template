//
//  ApiEndpoints.swift
//  SwiftUIImplementation
//
//  Created by Ronald Chester Whigan on 5/9/23.
//

import Foundation

class ApiEndpoints {
    static let baseUrl = "https://dummyjson.com"
    
    enum Endpoints: String {
        case posts
        case users
        
        var url: String {
            switch self {
            case .users:
                return "\(ApiEndpoints.baseUrl)/users"
            case .posts:
                return "\(ApiEndpoints.baseUrl)/posts"
            }
        }
    }
}
