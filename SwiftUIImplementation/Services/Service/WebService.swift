//
//  WebService.swift
//  SwiftUIImplementation
//
//  Created by Ronald Chester Whigan on 5/9/23.
//

import Foundation

class WebService {
    fileprivate var apiService = ApiService()

    func getRequest(url: String) -> () -> Void {
        return {
            // Perform GET request logic with the provided URL
            print("GET request to: \(url)")
        }
    }
    
    func postRequest(url: String, body: [String: Any]) -> () -> Void {
        return {
            // Perform POST request logic with the provided URL and body
            print("POST request to: \(url)")
            print("Body: \(body)")
        }
    }
    
    func putRequest(url: String, body: [String: Any]) -> () -> Void {
        return {
            // Perform PUT request logic with the provided URL and body
            print("PUT request to: \(url)")
            print("Body: \(body)")
        }
    }
    
    func deleteRequest(url: String) -> () -> Void {
        return {
            // Perform DELETE request logic with the provided URL
            print("DELETE request to: \(url)")
        }
    }
    
    func performRequest(for httpMethod: HTTPMethod, url: String, body: [String: Any] = [:]) -> () -> Void {
        switch httpMethod {
        case .get:
            return getRequest(url: url)
        case .post:
            return postRequest(url: url, body: body)
        case .put:
            return putRequest(url: url, body: body)
        case .delete:
            return deleteRequest(url: url)
        }
    }
}

