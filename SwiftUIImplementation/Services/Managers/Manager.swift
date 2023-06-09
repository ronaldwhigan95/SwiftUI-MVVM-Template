//
//  Manager.swift
//  SwiftUIImplementation
//
//  Created by Ronald Chester Whigan on 5/9/23.
//

import Foundation

protocol Manager {
    associatedtype WebServiceType: WebService
    var webService: WebServiceType { get }
}
