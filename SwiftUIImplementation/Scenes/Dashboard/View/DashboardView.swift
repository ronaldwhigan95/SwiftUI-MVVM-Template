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
            List {
                ForEach(viewModel.users.users) { user in
                    Text(user.firstName)
                }
            }
            .onAppear {
                viewModel.getUsers()
            }
        }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
