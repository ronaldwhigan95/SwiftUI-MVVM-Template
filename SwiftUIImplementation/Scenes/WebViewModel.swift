//
//  WebViewModel.swift
//  SwiftUIImplementation
//
//  Created by Ronald Chester Whigan on 5/9/23.
//

import Foundation

protocol WebViewModel : ViewModel {
    associatedtype ManagerType: Manager
    var manager: ManagerType { get }
    func getList<T:Codable>() -> [T]
}
