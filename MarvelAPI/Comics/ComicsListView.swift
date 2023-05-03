//
//  ComicsListView.swift
//  MarvelAPI
//
//  Created by LEONARDO P S P LEAO on 02/05/23.
//

import Foundation
import SwiftUI

struct ComicsListView: View {
    @ObservedObject var viewModel: ComicsListViewModel
    init(viewModel: ComicsListViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        NavigationView {
            ZStack(alignment: .center) {
                Color.marvelRed
                    .edgesIgnoringSafeArea(.all)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                VStack {
                    if self.viewModel.isLoadingComics {
                        VStack {
                            Text("Loading Comics...")
                                .font(.callout)
                                .foregroundColor(.marvelYellow)
                            LottieView()
                        }
                        .padding(.vertical, 80)
                    }
                }
                .padding()
            }
        }
    }
}

struct ComicsListView_Previews: PreviewProvider {
    static var previews: some View {
        ComicsListView(viewModel: ComicsListViewModel(marvelAPIClient: MarvelAPIClientTestDataMock()))
    }
}
