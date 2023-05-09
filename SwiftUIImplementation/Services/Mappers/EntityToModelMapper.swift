//
//  Mapper.swift
//  SwiftUIImplementation
//
//  Created by Ronald Chester Whigan on 5/9/23.
//

import Foundation

protocol EntityToModelMapper {
    associatedtype Entity
    associatedtype Model

    func mapToModel(entity: Entity) -> Model
}
