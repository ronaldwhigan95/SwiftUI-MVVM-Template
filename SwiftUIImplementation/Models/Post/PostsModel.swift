//
//  PostsModel.swift
//  SwiftUIImplementation
//
//  Created by Ronald Chester Whigan on 6/6/23.
//

import Foundation

struct PostsModel: Model {
    let id = UUID()
    let posts: [PostModel]
}
