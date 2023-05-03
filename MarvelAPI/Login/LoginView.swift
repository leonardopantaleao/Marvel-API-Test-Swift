//
//  LoginView.swift
//  MarvelAPI
//
//  Created by LEONARDO P S P LEAO on 02/05/23.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel: LoginViewModel
    var body: some View {
        NavigationView {
            ZStack(alignment: .center) {
                NavigationLink(
                    destination: ComicsListView(viewModel: self.viewModel.comicsViewModel),
                    isActive: self.$viewModel.isShowingMainView) { EmptyView() }
                Color.marvelRed
                    .edgesIgnoringSafeArea(.all)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                VStack {
                    VStack(spacing: 0.5) {
                        ImageAssets.marvelLogo
                        Text("API Test App")
                            .font(.title)
                            .foregroundColor(.marvelYellow)
                    }
                    .padding(.vertical, 80)
                    VStack(spacing: 12) {
                        TextField("Public Key", text: self.$viewModel.publicKey)
                            .padding(.horizontal, 40)
                            .disableAutocorrection(true)
                        TextField("Md5 Hash", text: self.$viewModel.md5Hash)
                            .padding(.horizontal, 40)
                            .disableAutocorrection(true)
                    }
                    PrimaryActionButton(
                        title: "Try it out!",
                        foregroundColor: .white,
                        backgroundColor: .marvelBlue,
                        action: {
                            self.viewModel.tryItOutButtonTapped()
                        },
                        icon: nil
                    )
                    .padding(.top, 20)
                    .padding(.horizontal, 30)
                    if self.viewModel.showError {
                        Text("Error: Can't be empty!")
                            .font(.footnote)
                            .foregroundColor(.marvelYellow)
                    }
                    Spacer()
                    Text("Developed by Leonardo Panta Leão")
                        .foregroundColor(.white)
                        .font(.footnote)
                    Button("GitHub") {
                        if let url = URL(string: "https://github.com/leonardopantaleao") {
                            UIApplication.shared.open(url)
                        }
                    }
                    .font(.footnote)
                    .foregroundColor(.blue)
                }
                .padding()
                .textFieldStyle(.roundedBorder)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: LoginViewModel())
    }
}
