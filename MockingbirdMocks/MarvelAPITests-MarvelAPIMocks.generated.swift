//
//  MarvelAPITests-MarvelAPIMocks.generated.swift
//  MarvelAPI
//
//  Generated by Mockingbird v0.20.0.
//  DO NOT EDIT
//

@testable import MarvelAPI
@testable import Mockingbird
import Combine
import Foundation
import Lottie
import Swift
import SwiftUI
import UIKit

private let mkbGenericStaticMockContext = Mockingbird.GenericStaticMockContext()

// MARK: - Mocked MarvelAPIClientProtocol
public final class MarvelAPIClientProtocolMock: MarvelAPI.MarvelAPIClientProtocol, Mockingbird.Mock {
  typealias MockingbirdSupertype = MarvelAPI.MarvelAPIClientProtocol
  public static let mockingbirdContext = Mockingbird.Context()
  public let mockingbirdContext = Mockingbird.Context(["generator_version": "0.20.0", "module_name": "MarvelAPI"])

  fileprivate init(sourceLocation: Mockingbird.SourceLocation) {
    self.mockingbirdContext.sourceLocation = sourceLocation
    MarvelAPIClientProtocolMock.mockingbirdContext.sourceLocation = sourceLocation
  }

  // MARK: Mocked `fetchComics`()
  public func `fetchComics`() -> Future<[MarvelAPI.Comic], Error> {
    return self.mockingbirdContext.mocking.didInvoke(Mockingbird.SwiftInvocation(selectorName: "`fetchComics`() -> Future<[MarvelAPI.Comic], Error>", selectorType: Mockingbird.SelectorType.method, arguments: [], returnType: Swift.ObjectIdentifier((Future<[MarvelAPI.Comic], Error>).self))) {
      self.mockingbirdContext.recordInvocation($0)
      let mkbImpl = self.mockingbirdContext.stubbing.implementation(for: $0)
      if let mkbImpl = mkbImpl as? () -> Future<[MarvelAPI.Comic], Error> { return mkbImpl() }
      for mkbTargetBox in self.mockingbirdContext.proxy.targets(for: $0) {
        switch mkbTargetBox.target {
        case .super:
          break
        case .object(let mkbObject):
          guard var mkbObject = mkbObject as? MockingbirdSupertype else { break }
          let mkbValue: Future<[MarvelAPI.Comic], Error> = mkbObject.`fetchComics`()
          self.mockingbirdContext.proxy.updateTarget(&mkbObject, in: mkbTargetBox)
          return mkbValue
        }
      }
      if let mkbValue = self.mockingbirdContext.stubbing.defaultValueProvider.value.provideValue(for: (Future<[MarvelAPI.Comic], Error>).self) { return mkbValue }
      self.mockingbirdContext.stubbing.failTest(for: $0, at: self.mockingbirdContext.sourceLocation)
    }
  }

  public func `fetchComics`() -> Mockingbird.Mockable<Mockingbird.FunctionDeclaration, () -> Future<[MarvelAPI.Comic], Error>, Future<[MarvelAPI.Comic], Error>> {
    return Mockingbird.Mockable<Mockingbird.FunctionDeclaration, () -> Future<[MarvelAPI.Comic], Error>, Future<[MarvelAPI.Comic], Error>>(context: self.mockingbirdContext, invocation: Mockingbird.SwiftInvocation(selectorName: "`fetchComics`() -> Future<[MarvelAPI.Comic], Error>", selectorType: Mockingbird.SelectorType.method, arguments: [], returnType: Swift.ObjectIdentifier((Future<[MarvelAPI.Comic], Error>).self)))
  }
}

/// Returns a concrete mock of `MarvelAPIClientProtocol`.
public func mock(_ type: MarvelAPI.MarvelAPIClientProtocol.Protocol, file: StaticString = #file, line: UInt = #line) -> MarvelAPIClientProtocolMock {
  return MarvelAPIClientProtocolMock(sourceLocation: Mockingbird.SourceLocation(file, line))
}
