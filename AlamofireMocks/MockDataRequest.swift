//
//  MockDataRequest.swift
//  AlamofireEmbeddedMocks
//
//  Created by Colin HARRIS on 9/20/17.
//  Copyright © 2017 Colin Harris. All rights reserved.
//

import Foundation
import Alamofire

public class MockDataRequest: DataRequestProtocol {
    
    let data: Data
    
    public init(data: Data) {
        self.data = data
    }
    
    @discardableResult
    public func response(queue: DispatchQueue?,
                         completionHandler: @escaping (DefaultDataResponse) -> Void) -> Self {
        
        // TODO: ...
        fatalError("response(queue:completionHandler:) has not been implemented")
    }
    
    @discardableResult
    public func responseData(queue: DispatchQueue?,
                             completionHandler: @escaping (DataResponse<Data>) -> Void) -> Self {
        // TODO: ...
        fatalError("responseData(queue:completionHandler:) has not been implemented")
    }
    
    @discardableResult
    public func responseString(queue: DispatchQueue?,
                               encoding: String.Encoding?,
                               completionHandler: @escaping (DataResponse<String>) -> Void) -> Self {
        // TODO: ...
        fatalError("responseString(queue:encoding:completionHandler:) has not been implemented")
    }
    
    @discardableResult
    public func responseJSON(queue: DispatchQueue?,
                      options: JSONSerialization.ReadingOptions,
                      completionHandler: @escaping (DataResponse<Any>) -> Void) -> Self {
        
        let result = Result {
            return try JSONSerialization.jsonObject(with: data, options: options)
        }
        let dataResponse = DataResponse(request: nil, response: nil, data: data, result: result)
        completionHandler(dataResponse)
        return self
    }
    
    @discardableResult
    public func responsePropertyList(queue: DispatchQueue?,
                                     options: PropertyListSerialization.ReadOptions,
                                     completionHandler: @escaping (DataResponse<Any>) -> Void) -> Self {
        // TODO: ...
        fatalError("responsePropertyList(queue:options:completionHandler:) has not been implemented")
    }
    
    public func cancel() {
        fatalError("cancel() has not been implemented")
    }
    
    // TODO: May need to move this to a MockDownloadRequest class
    @discardableResult
    public func downloadProgress(queue: DispatchQueue, closure: @escaping Request.ProgressHandler) -> Self {
        fatalError("downloadProgress(queue: queue, closure: closure) has not been implemented")
    }
}
