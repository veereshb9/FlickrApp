//
//  FlickrHomeView.swift
//  FlickrApp
//
//  Created by Veeresh on 6/28/24.
//

import SwiftUI
import Kingfisher

struct FlickrHomeView: View {
    @State private var viewModel = FlickrHomeViewModel()
    @State private var searchString: String = ""
    private let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
        NavigationStack {
            content
                .overlay {
                    if viewModel.isViewLoading {
                        activityIndicator
                    }
                }
                .padding()
                .navigationTitle("FlickrApp")
        }
        .searchable(text: $searchString, prompt: Text("Search for Images"))
        .onChange(of: searchString) { oldValue, newValue in
            viewModel.searchObserver.send(newValue)
        }
    }
    
    @ViewBuilder var content: some View {
        VStack {
            if viewModel.imagesList.isEmpty && !viewModel.isViewLoading {
                noData
            } else {
                imageCollection
            }
        }
    }
    
    @ViewBuilder var imageCollection: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(viewModel.imagesList) { model in
                    NavigationLink {
                        FlickrImageDetailView(model: model)
                    } label: {
                        FlickrImageCell(model: model)
                    }
                }
            }
        }
    }
    
    @ViewBuilder var noData: some View {
        Text(viewModel.errorMessage ?? "Search for an Image")
    }
    
    @ViewBuilder var activityIndicator: some View {
        ProgressView()
    }
}

#Preview {
    FlickrHomeView()
}
