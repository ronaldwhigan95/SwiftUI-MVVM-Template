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
    
    var itemsToShow = 5
    let totalItems = Array(1...10)
    
    func getUsers() {
        manager.getUsers { [weak self] result in
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
        postManager.getPosts { [weak self] result in
            switch result {
            case .success(let postsModel):
                DispatchQueue.main.async {
                    self?.posts = postsModel
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func userWith(id: Int) -> UserModel {
        users.users.first(where: {$0.id == id}) ?? .unknown
    }
    
    
    func getPostsWithUser() {
        for post in self.posts.posts {
            for user in self.users.users {
                if user.id == post.userId {
                    let post = PostWithUser(postUserId: post.userId, userImg: user.image, postUserName: "\(user.firstName) \(user.lastName)", postTitle: post.title, postBody: post.body)
                    
                    self.postsWithUser.append(post)
                    print(self.postsWithUser)
                    
                }
            }
        }
    }
}

extension UserModel {
    static let unknown = UserModel(id: -1, firstName: "Unknown", lastName: "Unknown", email: "", image: "")
}

struct PostWithUser: Identifiable {
    var id = UUID()
    let postUserId: Int
    let userImg: String
    let postUserName: String
    let postTitle: String
    let postBody: String
}
