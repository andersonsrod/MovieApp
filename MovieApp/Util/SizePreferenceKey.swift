//
//  SizePreferenceKey.swift
//  MovieApp
//
//  Created by Anderson Ricardo dos Santos Rodrigues.
//

import SwiftUI

struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}
