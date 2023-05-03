//
//  ComicsListTests.swift
//  MarvelAPITests
//
//  Created by LEONARDO P S P LEAO on 02/05/23.
//

import Combine
@testable import MarvelAPI
import Mockingbird
import XCTest

final class ComicsListTests: XCTestCase {
    var sut: ComicsListViewModel!
    var marvelAPIClientMock: MarvelAPIClientProtocolMock!
    override func setUp() {
        UserDefaults.standard.removeObject(forKey: "publicKey")
        UserDefaults.standard.removeObject(forKey: "md5Hash")
        self.marvelAPIClientMock = mock(MarvelAPIClientProtocol.self)
        self.sut = ComicsListViewModel(marvelAPIClient: self.marvelAPIClientMock)
        super.setUp()
    }
    override func tearDown() {
        UserDefaults.standard.removeObject(forKey: "publicKey")
        UserDefaults.standard.removeObject(forKey: "md5Hash")
        self.marvelAPIClientMock = nil
        self.sut = nil
        super.tearDown()
    }
    func testAPIError() throws {
        // given
        let expectation = XCTestExpectation(description: "wait for fetching comics.")
        givenSwift(self.marvelAPIClientMock.fetchComics()).will {
            XCTAssertTrue(self.sut.isLoadingComics)
            return Future { promise in
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    promise(.failure(MarvelAPIClientError.apiError))
                    expectation.fulfill()
                }
            }
        }
        // when
        self.sut.fetchComics()
        // then
        wait(for: [expectation])
        verify(self.marvelAPIClientMock.fetchComics()).wasCalled(1)
        XCTAssertFalse(self.sut.isLoadingComics)
        XCTAssertTrue(self.sut.showError)
    }

}
