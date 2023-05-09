//
//  View.swift
//  SwiftUIImplementation
//
//  Created by Ronald Chester Whigan on 5/9/23.
//

import Foundation

protocol ViewProtocol {
    associatedtype ViewModelType: ViewModel
    
    var vm: ViewModelType { get }
}
