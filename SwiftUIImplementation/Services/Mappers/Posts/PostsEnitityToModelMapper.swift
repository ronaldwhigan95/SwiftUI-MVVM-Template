//
//  PostsEnitityToModelMapper.swift
//  SwiftUIImplementation
//
//  Created by Ronald Chester Whigan on 6/6/23.
//

import Foundation

class PostsEntityToModelMapper: EntityToModelMapper {
    typealias ObjectEntity = PostsEntity
    typealias ObjectModel = PostsModel
    
    func mapToModel(entity: ObjectEntity) -> ObjectModel {
        let postEntityToModelMapper = PostEntityToModelMapper()
        let postModels = entity.posts.map { postEntityToModelMapper.mapToModel(entity: $0) }
        return PostsModel(posts: postModels)
    }
}
