//
//  MovieAppApp.swift
//  MovieApp
//
//  Created by Anderson Ricardo dos Santos Rodrigues.
//

import SwiftUI
import UIKit

@main
struct MovieAppApp: App {

    var body: some Scene {
        WindowGroup {
            MovieView()
                .onAppear {
                    UINavigationBar.appearance().setPrimaryLargeTitleAppearance()
                }
        }
    }
}
