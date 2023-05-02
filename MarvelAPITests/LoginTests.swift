//
//  LoginTests.swift
//  MarvelAPITests
//
//  Created by LEONARDO P S P LEAO on 02/05/23.
//

import XCTest
@testable import MarvelAPI

final class LoginTests: XCTestCase {
    var sut: LoginViewModel!
    
    override func setUp() {
        UserDefaults.standard.removeObject(forKey: "publicKey")
        UserDefaults.standard.removeObject(forKey: "md5Hash")
        self.sut = LoginViewModel()
        super.setUp()
    }
    
    override func tearDown() {
        UserDefaults.standard.removeObject(forKey: "publicKey")
        UserDefaults.standard.removeObject(forKey: "md5Hash")
        self.sut = nil
        super.tearDown()
    }
    
    func testBothFieldsEmpty() {
        //given
        self.sut.publicKey = ""
        self.sut.md5Hash = ""
        //when
        self.sut.tryItOutButtonTapped()
        //then
        XCTAssertEqual(UserDefaults.standard.string(forKey: "publicKey") ?? "", "")
        XCTAssertEqual(UserDefaults.standard.string(forKey: "md5Hash") ?? "", "")
        XCTAssertTrue(self.sut.showError)
    }
    
    func testPublicKeyEmpty() {
        //given
        self.sut.publicKey = ""
        self.sut.md5Hash = "testMd5Hash"
        //when
        self.sut.tryItOutButtonTapped()
        //then
        XCTAssertEqual(UserDefaults.standard.string(forKey: "publicKey") ?? "", "")
        XCTAssertEqual(UserDefaults.standard.string(forKey: "md5Hash") ?? "", "")
        XCTAssertTrue(self.sut.showError)
    }
    
    func testMD5HashEmpty() {
        //given
        self.sut.publicKey = "testPublicKey"
        self.sut.md5Hash = ""
        //when
        self.sut.tryItOutButtonTapped()
        //then
        XCTAssertEqual(UserDefaults.standard.string(forKey: "publicKey") ?? "", "")
        XCTAssertEqual(UserDefaults.standard.string(forKey: "md5Hash") ?? "", "")
        XCTAssertTrue(self.sut.showError)
    }
    
    func testFieldsStoredSuccessfully() {
        //given
        self.sut.publicKey = "testPublicKey"
        self.sut.md5Hash = "testMd5Hash"
        //when
        self.sut.tryItOutButtonTapped()
        //then
        XCTAssertEqual(UserDefaults.standard.string(forKey: "publicKey") ?? "", "testPublicKey")
        XCTAssertEqual(UserDefaults.standard.string(forKey: "md5Hash") ?? "", "testMd5Hash")
        XCTAssertFalse(self.sut.showError)
    }

}
