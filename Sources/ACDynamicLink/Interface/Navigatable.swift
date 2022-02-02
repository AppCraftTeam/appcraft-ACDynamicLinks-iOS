//
//  Navigatable.swift
//  
//
//  Created by Анатолий Руденко on 02.02.2022.
//

import Foundation

protocol Navigatable {
    var path: String { get }
    var id: String? { get }
}
