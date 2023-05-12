//
//  DashboardViewModel.swift
//  SwiftUIImplementation
//
//  Created by Ronald Chester Whigan on 5/9/23.
//

import Foundation

class DashboardViewModel: WebViewModel, ObservableObject {
    var manager: UserManager = UserManager()
    
    @Published var users: UsersModel = UsersModel(users: [UserModel(id: 0, firstName: "", lastName: "", email: "", image: "")])
    
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
}
