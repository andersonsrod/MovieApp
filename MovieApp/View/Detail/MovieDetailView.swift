//
//  MovieDetailView.swift
//  MovieApp
//
//  Created by Anderson Ricardo dos Santos Rodrigues.
//

import SwiftUI

struct MovieDetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let viewModel: MovieDetailViewModel
        
    private var headerView: some View {
        HStack(spacing: 10) {
            AsyncImage(url: viewModel.image) { image in
                image.resizable()
            } placeholder: {
                Color.gray
            }
            .frame(width: 100, height: 150)
            .clipShape(.rect(cornerRadius: 0))
            
            VStack(spacing: 10) {
                HStack {
                    Text(viewModel.name)
                        .font(.system(size: 16, weight: .semibold))
                    Spacer()
                }
                
                HStack {
                    Text(viewModel.runTime)
                        .font(.system(size: 14, weight: .regular))
                    Spacer()
                }
                
                Spacer()
            }
            
            Spacer()
        }
        .fixedSize(horizontal: false, vertical: true)
    }
    
    private var footerView: some View {
        VStack(spacing: 10) {
            HStack(spacing: 10) {
                Text("Time")
                    .font(.system(size: 16, weight: .semibold))
                    .multilineTextAlignment(.leading)
                
                Text(viewModel.time)
                    .font(.system(size: 16, weight: .regular))
                    .multilineTextAlignment(.leading)

                Spacer()
            }
            
            HStack(spacing: 10) {
                VStack {
                    Text("Days")
                        .font(.system(size: 16, weight: .semibold))
                    Spacer()
                }
                
                VStack(spacing: 5) {
                    ForEach(viewModel.days, id:\.self) { day in
                        HStack {
                            Text(day)
                                .font(.system(size: 16, weight: .regular))
                            Spacer()
                        }
                    }
                    Spacer()
                }
                
                Spacer()
            }
            .fixedSize(horizontal: false, vertical: true)
        }
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                headerView
                
                Divider()
                    .padding(.top, 10)
                
                HStack {
                    Text("Summary")
                        .font(.system(size: 16, weight: .semibold))
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                    .padding(.top, 10)
                
                HStack {
                    Text(viewModel.summary ?? "")
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                    .padding(.top, 10)
                
                Divider()
                    .padding(.top, 20)
                
                footerView
                    .padding(.top, 10)
            }
        }
        .navigationBarTitle("Movie Detail")
        .navigationBarBackButtonHidden(false)
        .padding(.horizontal, 20)
        .padding(.vertical, 16)
    }
}
