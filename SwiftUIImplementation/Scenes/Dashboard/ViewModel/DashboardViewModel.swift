//
//  DashboardViewModel.swift
//  SwiftUIImplementation
//
//  Created by Ronald Chester Whigan on 5/9/23.
//

import Foundation

class DashboardViewModel: WebViewModel {

    var manager: TempManager = TempManager()
    
    func getList<T>() -> [T] where T : Decodable, T : Encodable {
        return [T]()
    }
}
