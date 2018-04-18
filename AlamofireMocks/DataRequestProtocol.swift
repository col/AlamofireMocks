//
//  DataRequestProtocol.swift
//  AlamofireMocks
//
//  Created by Colin HARRIS on 9/20/17.
//  Copyright © 2017 Colin Harris. All rights reserved.
//

import Foundation
import Alamofire

public protocol DataRequestProtocol {
    
    // Response Handler - Unserialized Response
    @discardableResult
    func response(queue: DispatchQueue?,
                  completionHandler: @escaping (DefaultDataResponse) -> Void) -> Self
    
    // Response Data Handler - Serialized into Data
    @discardableResult
    func responseData(queue: DispatchQueue?,
                      completionHandler: @escaping (DataResponse<Data>) -> Void) -> Self
    
    // Response String Handler - Serialized into String
    @discardableResult
    func responseString(queue: DispatchQueue?,
                        encoding: String.Encoding?,
                        completionHandler: @escaping (DataResponse<String>) -> Void) -> Self
    
    // Response JSON Handler - Serialized into Any
    @discardableResult
    func responseJSON(queue: DispatchQueue?,
                      options: JSONSerialization.ReadingOptions,
                      completionHandler: @escaping (DataResponse<Any>) -> Void) -> Self
    
    // Response PropertyList (plist) Handler - Serialized into Any
    @discardableResult
    func responsePropertyList(queue: DispatchQueue?,
                              options: PropertyListSerialization.ReadOptions,
                              completionHandler: @escaping (DataResponse<Any>) -> Void) -> Self
}

public extension DataRequestProtocol {
    
    @discardableResult
    func response(queue: DispatchQueue? = nil,
                  completionHandler: @escaping (DefaultDataResponse) -> Void) -> Self {
        return response(queue: queue, completionHandler: completionHandler)
    }
    
    @discardableResult
    func responseData(queue: DispatchQueue? = nil,
                      completionHandler: @escaping (DataResponse<Data>) -> Void) -> Self {
        return responseData(queue: queue, completionHandler: completionHandler)
    }
    
    @discardableResult
    func responseString(queue: DispatchQueue? = nil,
                        encoding: String.Encoding? = nil,
                        completionHandler: @escaping (DataResponse<String>) -> Void) -> Self {
        return responseString(queue: queue, encoding: encoding, completionHandler: completionHandler)
    }
    
    @discardableResult
    public func responseJSON(queue: DispatchQueue? = nil,
                             options: JSONSerialization.ReadingOptions = .allowFragments,
                             completionHandler: @escaping (DataResponse<Any>) -> Void) -> Self {
        
        return responseJSON(queue: queue, options: options, completionHandler: completionHandler)
    }
    
    @discardableResult
    public func responsePropertyList(queue: DispatchQueue? = nil,
                                     options: PropertyListSerialization.ReadOptions = [],
                                     completionHandler: @escaping (DataResponse<Any>) -> Void) -> Self {
        
        return responsePropertyList(queue: queue, options: options, completionHandler: completionHandler)
    }
    
}

extension DataRequest: DataRequestProtocol {
    
}
