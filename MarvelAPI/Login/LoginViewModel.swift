//
//  LoginViewModel.swift
//  MarvelAPI
//
//  Created by LEONARDO P S P LEAO on 02/05/23.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var publicKey = ""
    @Published var md5Hash = ""
    @Published var showError = false
    @Published var isShowingMainView = false
    func tryItOutButtonTapped() {
        if !self.publicKey.isEmpty && !self.md5Hash.isEmpty {
            self.showError = false
            UserDefaults.standard.set(self.publicKey, forKey: "publicKey")
            UserDefaults.standard.set(self.md5Hash, forKey: "md5Hash")
            self.isShowingMainView = true
        } else {
            self.showError = true
        }
    }
}
