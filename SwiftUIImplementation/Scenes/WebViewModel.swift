//
//  WebViewModel.swift
//  SwiftUIImplementation
//
//  Created by Ronald Chester Whigan on 5/9/23.
//

import Foundation

protocol WebViewModel : ViewModel {
    func getList<T:Codable>() -> [T]
}
