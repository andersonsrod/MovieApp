//
//  MovieView.swift
//  MovieApp
//
//  Created by Anderson Ricardo dos Santos Rodrigues.
//

import SwiftUI

struct MovieView: View {
    @ObservedObject var viewModel = MovieViewModel(service: RemoteShowService())
    
    @State var height: CGFloat = 0
    
    private var listView: some View {
        LazyVStack(spacing: 0) {
            ForEach(viewModel.shows ?? [], id:\.id) { show in
                NavigationLink(value: show) {
                    MovieItemView(viewModel: .init(show: show))
                        .onAppear {
                            if show.id == viewModel.shows?.first?.id {
                                withAnimation {
                                    viewModel.showBackoTopButton = false
                                }
                            }
                                
                            if show.id == viewModel.shows?.last?.id {
                                Task {
                                    await viewModel.load(loadMore: true)
                                }
                            }
                        }
                        .onDisappear {
                            if show.id == viewModel.shows?.first?.id {
                                withAnimation {
                                    viewModel.showBackoTopButton = true
                                }
                            }
                        }
                }
                .id(show.id)
            }
        }
    }
    
    private func buttonBackToTopView(proxy: ScrollViewProxy) -> some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button {
                    withAnimation {
                        proxy.scrollTo(viewModel.shows?.first?.id)
                    }
                } label: {
                    SwiftUI.Image(systemName: "chevron.up")
                        .frame(width: 70, height: 70)
                        .background(Color.primaryColor.opacity(0.5))
                        .foregroundColor(.white)
                        .cornerRadius(35)
                }
            }
        }
        .padding(.trailing, 10)
    }
    
    var body: some View {
        NavigationStack {
            ScrollViewReader { proxy in
                ZStack {
                    ScrollView {
                        VStack {
                            if viewModel.showHasNoDataText {
                                VStack {
                                    Spacer()
                                        .frame(height: height / 2)
                                    Text("Oops.. No data found!")
                                        .font(.system(size: 16, weight: .semibold))
                                }
                            } else {
                                listView
                                    .navigationDestination(for: Show.self, destination: { show in
                                        MovieDetailView(viewModel: .init(show: show))
                                    })
                            }
                        }
                    }
                    .refreshable(action: {
                        Task {
                            await viewModel.load()
                        }
                    })
                    .padding(.bottom, 5)
                    .opacity(viewModel.isLoading ? 0.5 : 1)
                    .overlay {
                        GeometryReader { proxy in
                            Color.clear.preference(key: SizePreferenceKey.self, value: proxy.size)
                        }
                    }
                    .onPreferenceChange(SizePreferenceKey.self) { value in
                        height = value.height
                    }
                    
                    ProgressView()
                        .opacity(viewModel.isLoading ? 1 : 0)
                    
                    if viewModel.showBackoTopButton {
                        buttonBackToTopView(proxy: proxy)
                    }
                }
                .navigationBarTitle("Movies")
                .onAppear {
                    if viewModel.hasNoData {
                        Task {
                            await viewModel.load()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    MovieView()
}
