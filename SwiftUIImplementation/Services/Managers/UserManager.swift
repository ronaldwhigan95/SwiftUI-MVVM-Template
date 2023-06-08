//
//  TempManager.swift
//  SwiftUIImplementation
//
//  Created by Ronald Chester Whigan on 5/9/23.
//

import Foundation


class UserManager: Manager {
    var webService = WebService()
    
    func getUsers(limitedTo limit: Int = 0,completion: @escaping (Result<UsersModel, Error>) -> Void) {
        webService.get(url: ApiEndpoints.Endpoints.users(limit: limit).url, headers: nil, entity: UsersEntity.self) { result in
            switch result {
            case .success(let data):
                let mapper = UsersEntityToModelMapper()
                let model = mapper.mapToModel(entity: data as! UsersEntityToModelMapper.ObjectEntity)
                completion(.success(model))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
