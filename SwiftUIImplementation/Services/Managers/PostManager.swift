//
//  PostManager.swift
//  SwiftUIImplementation
//
//  Created by Ronald Chester Whigan on 6/6/23.
//

import Foundation


class PostManager: Manager {
    var webService = WebService()
    
    func getPosts(completion: @escaping (Result<PostsModel, Error>) -> Void) {
        webService.get(url: ApiEndpoints.Endpoints.posts.url, headers: nil, entity: PostsEntity.self) { result in
            switch result {
            case .success(let data):
                let mapper = PostsEntityToModelMapper()
                let model = mapper.mapToModel(entity: data as! PostsEntityToModelMapper.ObjectEntity)
                completion(.success(model))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
