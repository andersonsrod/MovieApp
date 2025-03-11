//
//  UINavigationBar+Helpers.swift
//  MovieApp
//
//  Created by Anderson Ricardo dos Santos Rodrigues.
//

import UIKit

extension UINavigationBar {
    func setPrimaryLargeTitleAppearance() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.backgroundColor = .primaryColor
                
        standardAppearance = navBarAppearance
        scrollEdgeAppearance = navBarAppearance
        
    }
}
