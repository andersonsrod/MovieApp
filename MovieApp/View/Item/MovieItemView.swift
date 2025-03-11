//
//  MovieItemView.swift
//  MovieApp
//
//  Created by Anderson Ricardo dos Santos Rodrigues.
//

import SwiftUI

struct MovieItemView: View {
    let viewModel: MovieItemViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            Divider()
            
            HStack(spacing: 10) {
                AsyncImage(url: viewModel.image) { image in
                    image.resizable()
                } placeholder: {
                    Color.gray
                }
                .frame(width: 100, height: 150)
                .clipShape(.rect(cornerRadius: 10))
                
                VStack(spacing: 10) {
                    HStack {
                        Text(viewModel.name)
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundStyle(Color.darkGray)
                            .multilineTextAlignment(.leading)
                        Spacer()
                    }

                    HStack {
                        Text(viewModel.genres)
                            .font(.system(size: 16, weight: .regular))
                            .foregroundStyle(Color.darkGray)
                            .multilineTextAlignment(.leading)
                        Spacer()
                    }
                    
                    Spacer()
                }
                .padding(.top, 10)
                
                Spacer()
            }
            .padding(.vertical, 5)
            .padding(.horizontal, 15)
            .fixedSize(horizontal: false, vertical: true)
            
            Divider()
        }
    }
}
