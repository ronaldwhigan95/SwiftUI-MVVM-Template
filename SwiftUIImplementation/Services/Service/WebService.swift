//
//  WebService.swift
//  SwiftUIImplementation
//
//  Created by Ronald Chester Whigan on 5/9/23.
//

import Foundation

class WebService {
    
    let apiService = ApiService.shared
    
    func get<T:Codable>(url: String, headers:[String:String]?,model: T.Type, completionBlock: CompletionHandler<Any>) -> () -> Void {
        return {
            self.apiService.sendRequest(url: url, method: .get, headers: headers, model: model, completionBlock: completionBlock)
        }
    }
    
    func post<T:Codable>(url: String, headers:[String:String]?,model: T.Type, completionBlock: CompletionHandler<Any>) -> () -> Void {
        return {
            self.apiService.sendRequest(url: url, method: .post, headers: headers, model: model, completionBlock: completionBlock)
        }
    }
    
    func put<T:Codable>(url: String, headers:[String:String]?,model: T.Type, completionBlock: CompletionHandler<Any>) -> () -> Void {
        return {
            self.apiService.sendRequest(url: url, method: .put, headers: headers, model: model, completionBlock: completionBlock)
        }
    }
    
    func delete<T:Codable>(url: String, headers:[String:String]?,model: T.Type, completionBlock: CompletionHandler<Any>) -> () -> Void {
        return {
            self.apiService.sendRequest(url: url, method: .delete, headers: headers, model: model, completionBlock: completionBlock)
        }
    }
    
    func performRequest<T:Codable>(url: String,for headers:[String:String]?,model: T.Type, method: HTTPMethod, completionBlock: CompletionHandler<Any>) -> () -> Void {
        switch method {
        case .get:
            return get(url: url, headers:headers,model:model,completionBlock: completionBlock)
        case .post:
            return post(url: url, headers:headers,model:model,completionBlock: completionBlock)
        case .put:
            return put(url: url, headers:headers,model:model,completionBlock: completionBlock)
        case .delete:
            return delete(url: url, headers:headers,model:model,completionBlock: completionBlock)
        }
    }
}

