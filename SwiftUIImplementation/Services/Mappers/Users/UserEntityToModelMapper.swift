//
//  UserEntityToModelMapper.swift
//  SwiftUIImplementation
//
//  Created by Ronald Chester Whigan on 5/11/23.
//

import Foundation

class UserEntityToModelMapper: EntityToModelMapper {
    typealias ObjectModel = UserModel
    typealias ObjectEntity = UserEntity
    
    func mapToModel(entity: ObjectEntity) -> ObjectModel {
        return UserModel(id: entity.id, firstName: entity.firstName, lastName: entity.lastName, email: entity.email, image: entity.image)
    }
}
