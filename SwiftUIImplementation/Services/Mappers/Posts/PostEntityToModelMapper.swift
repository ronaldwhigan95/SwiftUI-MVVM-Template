//
//  PostEntityToModelMapper.swift
//  SwiftUIImplementation
//
//  Created by Ronald Chester Whigan on 6/6/23.
//

import Foundation

class PostEntityToModelMapper: EntityToModelMapper {
    typealias ObjectEntity = PostEntity
    typealias ObjectModel = PostModel
    
    func mapToModel(entity: ObjectEntity) -> ObjectModel {
        return PostModel(id: entity.id,userId: entity.userId, title: entity.title, body: entity.body)
    }
}
