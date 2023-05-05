//
//  ComicsListViewModel.swift
//  MarvelAPI
//
//  Created by LEONARDO P S P LEAO on 02/05/23.
//

import Foundation
import Combine

class ComicsListViewModel: ObservableObject {
    @Published var isLoadingComics = false
    @Published var comics: [Comic] = []
    @Published var showError = false
    @Published var errorMessage = ""
    @Published var isShowingCartView = false
    @Published var searchText = ""
    var filteredComics: [Comic] {
        self.searchText.isEmpty ?
        self.comics : self.comics.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
    }
    var cartViewModel = CartViewModel()
    var cancellables = Set<AnyCancellable>()
    let marvelAPIClient: MarvelAPIClientProtocol
    init(marvelAPIClient: MarvelAPIClientProtocol) {
        self.marvelAPIClient = marvelAPIClient
    }
    func fetchComics() {
        self.isLoadingComics = true
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
    func formatPrice(price: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "en_US")
        return formatter.string(from: NSNumber(value: price)) ?? ""
    }
    func addToCartButtonTapped(comic: Comic) {
        self.cartViewModel.comics.append(comic)
        self.cartViewModel.updateTotal()
        self.isShowingCartView = true
    }
}
