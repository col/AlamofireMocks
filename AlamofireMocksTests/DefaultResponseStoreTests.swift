//
//  DefaultResponseStoreTests.swift
//  AlamofireMocksTests
//
//  Created by Colin Harris on 16/4/18.
//  Copyright © 2018 Colin Harris. All rights reserved.
//

import XCTest
@testable import AlamofireMocks

class DefaultResponseStoreTests: XCTestCase {
    
    var responseStore: DefaultResponseStore!
    
    override func setUp() {
        super.setUp()
        responseStore = DefaultResponseStore()
    }
    
    // .data(request:) Tests
    
    func testDataForRequestReturnsMockDataWhenTheMockExists() {
        let request = URLRequest(url: URL(string: "https://example.com/simple")!)
        let result = responseStore.data(for: request)
        let resultString = String(data: result, encoding: .utf8)
        XCTAssertEqual(resultString, "{\"response_for\": \"/simple\"}\n")
    }
    
    func testDataForRequestReturnsAndErrorMessageWhenTheMockDoeNotExists() {
        let request = URLRequest(url: URL(string: "https://example.com/unknown")!)
        let result = responseStore.data(for: request)
        let resultString = String(data: result, encoding: .utf8)
        XCTAssertEqual(resultString, "Mock file not found! Path: /unknown, Params: ()")
    }
    
    // .data(url: withParameters:) Tests
    
    func testDataForURLWithEmptyParamsReturnsTheDefaultMockData() {
        let url = URL(string: "https://example.com/with_manifest")!
        let result = responseStore.data(for: url, withParameters: nil)
        let resultString = String(data: result, encoding: .utf8)
        XCTAssertEqual(resultString, "{\"response_for\": \"/with_manifest\"}\n")
    }
    
    func testDataForURLWithParamsThatMatchTheManifestFileReturnsTheCorrectMockData() {
        let url = URL(string: "https://example.com/with_manifest")!
        let result = responseStore.data(for: url, withParameters: ["key": "apples"])
        let resultString = String(data: result, encoding: .utf8)
        XCTAssertEqual(resultString, "{\"response_for\": \"/with_manifest?key=apples\"}\n")
    }
    
    func testDataForURLWithParamsThatDoNoMatchTheManifestFileReturnsDefaultMockData() {
        let url = URL(string: "https://example.com/with_manifest")!
        let result = responseStore.data(for: url, withParameters: ["key": "unknown"])
        let resultString = String(data: result, encoding: .utf8)
        XCTAssertEqual(resultString, "{\"response_for\": \"/with_manifest\"}\n")
    }
    
}
