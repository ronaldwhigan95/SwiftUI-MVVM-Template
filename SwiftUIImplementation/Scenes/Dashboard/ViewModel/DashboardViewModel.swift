//
//  DashboardViewModel.swift
//  SwiftUIImplementation
//
//  Created by Ronald Chester Whigan on 5/9/23.
//

import Foundation

class DashboardViewModel: WebViewModel, ObservableObject {
    var manager: UserManager = UserManager()
    var postManager: PostManager = PostManager()
    
    @Published var users: UsersModel = UsersModel(users: [UserModel(id: 0, firstName: "", lastName: "", email: "", image: "")])
    @Published var posts: PostsModel = PostsModel(posts: [PostModel(id: 0,userId: 0, title: "", body: "")])
    
    @Published var postsWithUser = [PostWithUser(postUserId: 0, userImg: "",postUserName: "", postTitle: "", postBody: "")]
    
    var limit = 10
    
    func getUsers() {
//        manager.getUsers { [weak self] result in
//            switch result {
//            case .success(let usersModel):
//                DispatchQueue.main.async {
//                    self?.users = usersModel
//                }
//            case .failure(let error):
//                print("Error: \(error)")
//            }
//        }
        
        //Handle USERs, not a good idea to load all users.
        manager.getUsers() { [weak self] result in
            switch result {
            case .success(let usersModel):
                DispatchQueue.main.async {
                    self?.users = usersModel
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    func getPosts() {
        postManager.getPosts(limitedTo: limit) { [weak self] result in
                switch result {
                case .success(let postsModel):
                    DispatchQueue.main.async {
                        self?.posts = postsModel
                    }
                case .failure(let error):
                    print(error)
                }
        }
//        postManager.getPosts { [weak self] result in
//            switch result {
//            case .success(let postsModel):
//                DispatchQueue.main.async {
//                    self?.posts = postsModel
//                }
//            case .failure(let error):
//                print(error)
//            }
//        }
    }
    
    func onRefresh() {
        limit = 10
        getPosts()
    }
    
    func userWith(id: Int) -> UserModel {
        users.users.first(where: {$0.id == id}) ?? .unknown
    }
}

extension UserModel {
    static let unknown = UserModel(id: -1, firstName: "", lastName: "Unknown", email: "", image: "")
}

struct PostWithUser: Identifiable {
    var id = UUID()
    let postUserId: Int
    let userImg: String
    let postUserName: String
    let postTitle: String
    let postBody: String
}
