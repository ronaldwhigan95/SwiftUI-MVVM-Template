//
//  DashboardView.swift
//  SwiftUIImplementation
//
//  Created by Ronald Chester Whigan on 5/9/23.
//

import SwiftUI

struct DashboardView: View {
    @StateObject private var viewModel = DashboardViewModel()
    
    var body: some View {
        let users = viewModel.users.users
        let posts = viewModel.posts.posts
        let detailedPosts = viewModel.postsWithUser
        
        VStack {
            Text("Posts")
            //create posts
//            List {
//                ForEach(detailedPosts) { post in
//                    Text(post.postTitle)
//                }
//            }.task {
//
//                viewModel.getPostsWithUser()
//            }
//
            List {
                ForEach(posts) { post in
                    HStack {
                        Text(post.title)
                        Text(viewModel.userWith(id: post.userId).firstName)
                    }
                }
            }.task {
                viewModel.getPosts()
            }
            
            List {
                ForEach(users) { user in
                    Section {
                        HStack {
                            AsyncImage(url: URL(string: user.image), content: { img in
                                img.resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 50, height: 50)
                            }, placeholder: {
                                ProgressView()
                            })
                            .background()
                            .cornerRadius(30)
                            Text(user.firstName)
                            Text(user.lastName)
                        }
                    }
                    .listRowBackground(Color.gray)
                }
            }
            .scrollContentBackground(.hidden)
            //.onAppear old way to do a task
//            .onAppear {
//                viewModel.getUsers()
//            }
            //New is iOS15 .task
            .task {
                viewModel.getUsers()
            }
            
            .refreshable {
                
            }
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
