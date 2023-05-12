//
//  Users.swift
//  SwiftUIImplementation
//
//  Created by Ronald Chester Whigan on 5/9/23.
//

import Foundation

struct UsersModel: Model, Identifiable {
    let id = UUID()
    let users: [UserModel]
}
