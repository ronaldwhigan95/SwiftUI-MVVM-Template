//
//  HTTPURLResponse.swift
//  SwiftUIImplementation
//
//  Created by Ronald Chester Whigan on 5/11/23.
//

import Foundation

extension HTTPURLResponse {
    func isSuccessStatusCode() -> Bool {
        statusCode >= 200 && statusCode < 300
    }
}
