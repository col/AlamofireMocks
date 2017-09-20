//
//  MockSessionManager.swift
//  AlamofireEmbeddedMocks
//
//  Created by Colin HARRIS on 9/20/17.
//  Copyright © 2017 Colin Harris. All rights reserved.
//

import Foundation
import Alamofire

public class MockSessionManager: SessionManagerProtocol {
    
    let responseStore: ResponseStore
    
    public init(responseStore: ResponseStore = DefaultResponseStore()) {
        self.responseStore = responseStore
    }
    
    @discardableResult
    public func request(
        _ urlConvertable: URLConvertible,
        method: HTTPMethod,
        parameters: Parameters?,
        encoding: ParameterEncoding,
        headers: HTTPHeaders?) -> DataRequestProtocol {
        
        let url = try! urlConvertable.asURL()
        let data = responseStore.data(for: url, withParameters: parameters)
        return MockDataRequest(data: data)
    }
    
    public func request(_ urlRequest: URLRequestConvertible) -> DataRequestProtocol {
        let request = try! urlRequest.asURLRequest()
        let data = responseStore.data(for: request)
        return MockDataRequest(data: data)
    }
    
    // TODO: Add support for more Alamofire API's
}
