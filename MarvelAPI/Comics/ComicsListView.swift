//
//  ComicsListView.swift
//  MarvelAPI
//
//  Created by LEONARDO P S P LEAO on 02/05/23.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

struct ComicsListView: View {
    @State var isLoading = false
    @ObservedObject var viewModel: ComicsListViewModel
    init(viewModel: ComicsListViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
            ZStack(alignment: .center) {
                NavigationLink(
                    destination: CartView(viewModel: self.viewModel.cartViewModel),
                    isActive: self.$viewModel.isShowingCartView) { EmptyView() }
                Color.marvelRed
                    .edgesIgnoringSafeArea(.all)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                if self.viewModel.isLoadingComics {
                    VStack {
                        Text("Loading Comics...")
                            .font(.callout)
                            .foregroundColor(.marvelYellow)
                        LottieView()
                    }
                    .padding(.vertical, 80)
                }
                if self.viewModel.showError {
                    Text(self.viewModel.errorMessage)
                        .font(.title)
                        .foregroundColor(.marvelYellow)
                } else {
                    ScrollView {
                        VStack {
                            Text("Comics")
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
                                        NavigationLink {
                                            self.detailView(comic: comic)
                                        } label: {
                                            Text("View details")
                                        }
                                        PrimaryActionButton(
                                            title: "Add to Cart",
                                            foregroundColor: .white,
                                            backgroundColor: .marvelBlue) {
                                                self.viewModel.addToCartButtonTapped(comic: comic)
                                            }
                                            .padding(.horizontal, 40)
                                            .padding(.bottom, 16)
                                    }
                                }
                                .cornerRadius(8)
                                .padding(.horizontal, 10)
                            }
                        }
                    }
                    .padding()
                }
            }
    }
    func detailView(comic: Comic) -> some View {
        ZStack {
            Color.white
            ScrollView {
                VStack(spacing: 20) {
                    Text(comic.title)
                        .font(.headline)
                    WebImage(url: URL(string: "\(comic.thumbnail.path.replacingOccurrences(of: "http", with: "https")).\(comic.thumbnail.extension)"), isAnimating: self.$isLoading)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .padding(.all, 20)
                    Text(comic.description ?? "")
                    Text("Issue: \(comic.issueNumber)")
                    PrimaryActionButton(
                        title: "Buy now!",
                        foregroundColor: .white,
                        backgroundColor: .marvelBlue) {
                            
                        }
                        .padding(.horizontal, 40)
                }
                .cornerRadius(8)
                .padding(.horizontal, 10)
            }
        }
    }
}

struct ComicsListView_Previews: PreviewProvider {
    static var previews: some View {
        ComicsListView(viewModel: ComicsListViewModel(marvelAPIClient: MarvelAPIClientTestDataMock()))
    }
}
