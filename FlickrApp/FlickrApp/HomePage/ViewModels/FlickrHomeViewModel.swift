//
//  FlickrHomeViewModel.swift
//  FlickrApp
//
//  Created by Veeresh on 6/28/24.
//

import SwiftUI
import Combine

@Observable
class FlickrHomeViewModel {
    var isViewLoading: Bool = false
    var imagesList: [FlickrImageModel] = []
    var searchObserver = CurrentValueSubject<String, Never>("")
    var errorMessage: String?
    
    private var cancellables = Set<AnyCancellable>()
    
    
    init() {
        addSearchObserver()
    }
    
    private func addSearchObserver() {
        searchObserver.debounce(for: .seconds(0.5), scheduler: RunLoop.main).sink { [weak self] searchString in
            self?.getList(with: searchString)
        }.store(in: &cancellables)
    }
    
    func getList(with searchString: String) {
        guard !searchString.isEmpty else {
            imagesList = []
            errorMessage = nil
            return
        }

        guard let url = URL(string: NetworkConstants.searchUrl + searchString) else { return }

        isViewLoading = true
        Task { [weak self] in
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            do {
                let response: FlickrResponseModel = try await NetworkManager.shared.start(request: request)
                self?.imagesList = response.items
                self?.errorMessage = response.items.isEmpty ? "No Search Results" : nil
            } catch {
                self?.imagesList = []
                self?.errorMessage = error.localizedDescription
            }
            self?.isViewLoading.toggle()
        }
    }
}
