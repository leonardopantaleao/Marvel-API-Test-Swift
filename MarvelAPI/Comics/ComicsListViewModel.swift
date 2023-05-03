//
//  ComicsListViewModel.swift
//  MarvelAPI
//
//  Created by LEONARDO P S P LEAO on 02/05/23.
//

import Foundation
import Combine

class ComicsListViewModel: ObservableObject {
    @Published var isLoadingComics = true
    @Published var comics: [Comic] = []
    @Published var showError = false
    @Published var errorMessage = ""
    var cancellables = Set<AnyCancellable>()
    let marvelAPIClient: MarvelAPIClientProtocol
    init(marvelAPIClient: MarvelAPIClientProtocol) {
        self.marvelAPIClient = marvelAPIClient
    }
    func fetchComics() {
        self.marvelAPIClient.fetchComics()
            .sink { [weak self] completion in
                guard let self = self else {
                    return
                }
                self.isLoadingComics = false
                switch completion {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    self.showError = true
                case .finished:
                    self.showError = false
                    ()
                }
            } receiveValue: { comics in
                self.comics = comics
            }
            .store(in: &self.cancellables)
    }
}
