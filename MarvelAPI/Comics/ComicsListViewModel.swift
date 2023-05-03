//
//  ComicsListViewModel.swift
//  MarvelAPI
//
//  Created by LEONARDO P S P LEAO on 02/05/23.
//

import Foundation

class ComicsListViewModel: ObservableObject {
    @Published var isLoadingComics = true
    @Published var comics: [Comic] = []
    @Published var showError = false
    let marvelAPIClient: MarvelAPIClientProtocol
    init(marvelAPIClient: MarvelAPIClientProtocol = MarvelAPIClient()) {
        self.marvelAPIClient = marvelAPIClient
    }
    func fetchComics() {
        self.marvelAPIClient.fetchComics()
    }
}
