//
//  User.swift
//  SwiftUIImplementation
//
//  Created by Ronald Chester Whigan on 5/9/23.
//

import Foundation

struct UserModel: Model {
    let id: Int
//   @UpperCased var firstName: String
    var firstName: String
    var lastName: String
    let email: String
    let image: String
}


//Sample of property Wrapper
@propertyWrapper class UpperCased {
    var wrappedValue: String = "" {
        didSet {
            wrappedValue = wrappedValue.uppercased()
        }
    }
    init(wrappedValue: String) {
        self.wrappedValue = wrappedValue.uppercased()
    }
}
