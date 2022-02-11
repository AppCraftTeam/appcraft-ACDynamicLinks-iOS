//
//  Reader.swift
//  
//
//  Created by Анатолий Руденко on 02.02.2022.
//

import Foundation

public typealias PathCompletionHandler = (_ path: NavigatablePath?) -> Void

public protocol Reader {
    func readFromURL(_ url: URL, completion: PathCompletionHandler) -> Bool
    func readFromUserActivity(_ activity: NSUserActivity, completion: @escaping PathCompletionHandler) -> Bool
}
