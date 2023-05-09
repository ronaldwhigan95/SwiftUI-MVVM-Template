//
//  LoginViewModel.swift
//  SwiftUIImplementation
//
//  Created by Ronald Chester Whigan on 5/9/23.
//

import Foundation

class LoginViewModel: WebViewModel {
    func getList<T>() -> [T] where T : Decodable, T : Encodable {
        //Do something
        return [DummyModel]() as! [T]
    }
    
    
}

struct DummyModel {
    var dummy1: String
    var dummy2: String
}
