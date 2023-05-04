//
//  CartView.swift
//  MarvelAPI
//
//  Created by LEONARDO P S P LEAO on 04/05/23.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

struct CartView: View {
    @ObservedObject var viewModel: CartViewModel
    @State var isLoading = false
    var body: some View {
        ZStack(alignment: .center) {
            Color.marvelRed
                .edgesIgnoringSafeArea(.all)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            ScrollView {
                VStack {
                    Text("Cart")
                        .font(.largeTitle)
                        .foregroundColor(.marvelYellow)
                    ForEach(self.viewModel.comics) { comic in
                        ZStack {
                            Color.white
                            VStack(spacing: 20) {
                                WebImage(url: URL(string: "\(comic.thumbnail.path.replacingOccurrences(of: "http", with: "https")).\(comic.thumbnail.extension)"), isAnimating: self.$isLoading)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .padding(.all, 20)
                                Text(comic.title)
                                    .font(.headline)
                                Text("Printed version price: \(self.viewModel.formatPrice(price: comic.prices[0].price))")
                                    .font(.callout)
                                if comic.prices.count >= 2 {
                                    Text("Digital version price: \(self.viewModel.formatPrice(price: comic.prices[1].price))")
                                        .font(.callout)
                                }
                                PrimaryActionButton(
                                    title: "Remove",
                                    foregroundColor: .white,
                                    backgroundColor: .marvelBlue) {
                                        self.viewModel.removeFromCart(comic: comic)
                                    }
                                    .padding(.horizontal, 40)
                                    .padding(.bottom, 16)
                                
                            }
                        }
                        .cornerRadius(8)
                        .padding(.horizontal, 10)
                    }
                }
                Spacer()
                    .frame(height: 40)
                Text(self.viewModel.totalString)
                    .font(.largeTitle)
                    .foregroundColor(.marvelYellow)
                PrimaryActionButton(
                    title: "Buy now!",
                    foregroundColor: .white,
                    backgroundColor: .marvelBlue) {
                        
                    }
                    .padding(.horizontal, 40)
                    .padding(.bottom, 16)
            }
            .padding()
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(viewModel: CartViewModel(comics: Comic.testData))
    }
}
