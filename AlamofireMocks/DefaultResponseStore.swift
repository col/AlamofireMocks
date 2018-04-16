//
//  DefaultResponseStore.swift
//  AlamofireMocks
//
//  Created by Col Harris on 20/09/2017.
//  Copyright © 2017 Colin Harris. All rights reserved.
//

import Foundation
import Alamofire

public class DefaultResponseStore: ResponseStore {
    
    public init() {}
    
    public func data(for request: URLRequest) -> Data {
        let path = request.url?.path ?? ""
        return mockData(forPath: path, withParameters: nil)
    }
    
    public func data(for url: URL, withParameters params: Parameters?) -> Data {
        return mockData(forPath: url.path, withParameters: params)
    }
    
    private func mockData(forPath path: String, withParameters params: Parameters?) -> Data {
        let fileName = fileNameFromManifest(forPath: path, params: params) ?? "default.json"
        let (resource, fileExtension) = splitFileName(fileName)
        let subDir = mocksDir(forPath: path)
        if let mockUrl = bundle().url(forResource: resource, withExtension: fileExtension, subdirectory: subDir) {
            if let mockData = try? Data(contentsOf: mockUrl) {
                return mockData
            }
        }
        let message = "Mock file not found! Path: \(path), Params: \(debugPrint(params ?? [:]))"
        print(message)
        return message.data(using: .utf8)!
    }
    
    private func splitFileName(_ fileName: String) -> (String, String) {
        let components = fileName.split(separator: ".")
        let name = String(describing: components.first ?? "")
        let fileExtension = String(describing: components.last ?? "")
        return (name, fileExtension)
    }
    
    private func fileNameFromManifest(forPath path: String, params: Parameters?) -> String? {
        if let manifest = manifestFile(forPath: path) {
            let match = manifest.filter { entry in
                if let entryParams = entry["params"] as? [String: Any] {
                    return params?.contains(entryParams) ?? false
                }
                return false
            }.first
            return match?["file"] as? String
        }
        return nil
    }
    
    private func manifestFile(forPath path: String) -> [[String: Any]]? {
        if let url = bundle().url(forResource: "manifest", withExtension: "json", subdirectory: mocksDir(forPath: path)) {
            if let manifest = loadJSONObject(fromURL: url) as? [[String: Any]] {
                return manifest
            }
        }
        return nil
    }
    
    private func mocksDir(forPath path: String) -> String {
        // TODO: add support for nested directories
        return "mocks\(path)"
    }
    
    private func loadJSONObject(fromURL url: URL) -> Any? {
        do {
            let data = try Data(contentsOf: url)
            return try JSONSerialization.jsonObject(with: data, options: .allowFragments)
        } catch {
            return nil
        }
    }
    
    private func bundle() -> Bundle {
        // TODO: Come up with a better way to switch bundles when running the tests
        return Bundle(identifier: "com.colharris.AlamofireMocksTests") ?? Bundle.main
    }
}
