//
//  ModelToEntityMapper.swift
//  SwiftUIImplementation
//
//  Created by Ronald Chester Whigan on 5/9/23.
//

import Foundation

protocol ModelToEntityMapper {
    associatedtype Entity
    associatedtype Model

    func mapToEntity(entity: Model) -> Entity
}
