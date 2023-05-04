//
//  CartViewModel.swift
//  MarvelAPI
//
//  Created by LEONARDO P S P LEAO on 04/05/23.
//

import Foundation

class CartViewModel: ObservableObject {
    var total: Double {
        self.comics.map { $0.prices[0].price }.reduce(0, { $0 + $1 })
    }
    @Published var totalString = ""
    var comics: [Comic]
    init(comics: [Comic] = []) {
        self.comics = comics
    }
    func formatPrice(price: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "en_US")
        return formatter.string(from: NSNumber(value: price)) ?? ""
    }
    func removeFromCart(comic: Comic) {
        self.comics.removeAll(where: { $0.id == comic.id })
        self.updateTotal()
    }
    func updateTotal() {
        self.totalString = "Total: \(self.formatPrice(price: total))"
    }
}
