//
//  ViewController.swift
//  Dynamic Link Example
//
//  Created by Анатолий Руденко on 11.02.2022.
//

import UIKit
import ACDynamicLink

class ViewController: UIViewController {
    
    // MARK: - Dynamic Link
    func generateLink(path: AppPath, id: String) {
        let destination = NavigationPath(path: path.rawValue, id: id)
        dynamicLink.generate(path: destination) { [weak self] url in
            
            // example of sharing a link
            guard let url = url else { return }
            let vc = UIActivityViewController(activityItems: [url.absoluteString], applicationActivities: nil)
            vc.popoverPresentationController?.sourceView = self?.view
            vc.modalPresentationStyle = .fullScreen
            self?.present(vc, animated: true)
        }
    }
}

