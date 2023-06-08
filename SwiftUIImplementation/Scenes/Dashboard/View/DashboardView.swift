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
        var posts = viewModel.posts.posts
        var isEnded = false

        VStack {
            VStack {
                Text("Posts")
                    .font(.system(size: 30))
                    .bold()
            }
            .frame(maxWidth: .infinity)
            .padding(.bottom,20)
            .background(Color.blue)
            
            List {
                ForEach(posts) { post in
                    let specUser = viewModel.userWith(id: post.userId)
                    Section {
                        VStack (alignment: .leading){
                            HStack {
                                    AsyncImage(url: URL(string: specUser.image), content: { img in
                                        img.resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 50, height: 50)
                                    }, placeholder: {
                                        Image(systemName: "person.crop.circle")
                                            .resizable()
                                            .frame(width: 30,height: 30)
                                    })
                                    .background()
                                    .cornerRadius(30)
                                Text(specUser.firstName == "" ? "Unknown" : specUser.firstName)
                                    .fontWeight(.bold)
                            }
                            Text(post.title)
                        }
                    }
                    .task {
                        if(posts.last?.userId == post.userId) {
                            viewModel.limit += 1
                            viewModel.getPosts()
                            isEnded = true
                        }
                    }
                    .refreshable {
                        posts.removeAll()
                        viewModel.onRefresh()
                    }
                }
                .listRowBackground(Color.blue.opacity(0.3))
            }
            .task {
                viewModel.getUsers()
                viewModel.getPosts()
            }
            .scrollContentBackground(.hidden)
            if(isEnded) {
                Text("No More To Present")
            }
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
