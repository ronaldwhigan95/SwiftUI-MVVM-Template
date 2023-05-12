//
//  UsersEntityToModelMapper.swift
//  SwiftUIImplementation
//
//  Created by Ronald Chester Whigan on 5/11/23.
//

import Foundation

class UsersEntityToModelMapper: EntityToModelMapper {
    typealias ObjectEntity = UsersEntity
    typealias ObjectModel = UsersModel

    
    func mapToModel(entity: ObjectEntity) -> ObjectModel {
        let userEntityToModelMapper = UserEntityToModelMapper()
        let userModels = entity.users.map { userEntityToModelMapper.mapToModel(entity: $0) }
        return UsersModel(users: userModels)
    }
}
