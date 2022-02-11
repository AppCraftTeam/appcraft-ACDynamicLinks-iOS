//
//  Reader.swift
//  
//
//  Created by Анатолий Руденко on 02.02.2022.
//

import Foundation

public protocol Reader {
    func readFromURL(_ url: URL, completion: CompletionHandler) -> Bool
    func readFromUserActivity(_ activity: NSUserActivity, completion: @escaping CompletionHandler) -> Bool
}
