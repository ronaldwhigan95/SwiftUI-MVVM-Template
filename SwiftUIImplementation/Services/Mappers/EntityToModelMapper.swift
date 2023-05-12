//
//  Mapper.swift
//  SwiftUIImplementation
//
//  Created by Ronald Chester Whigan on 5/9/23.
//

import Foundation

protocol EntityToModelMapper {
    associatedtype ObjectEntity: Codable
    associatedtype ObjectModel: Model

    
    func mapToModel(entity: ObjectEntity) -> ObjectModel
}
