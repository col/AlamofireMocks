//
//  MockSessionManager.swift
//  AlamofireEmbeddedMocks
//
//  Created by Colin HARRIS on 9/20/17.
//  Copyright © 2017 Colin Harris. All rights reserved.
//

import Foundation
import Alamofire

class MockSessionManager: SessionManagerProtocol {
    
    @discardableResult
    func request(
        _ url: URLConvertible,
        method: HTTPMethod,
        parameters: Parameters?,
        encoding: ParameterEncoding,
        headers: HTTPHeaders?) -> DataRequestProtocol {
        
        return MockDataRequest(url: try! url.asURL(), method: method, parameters: parameters, headers: headers)
        
    }
    
    func request(_ urlRequest: URLRequestConvertible) -> DataRequestProtocol {
        
        return MockDataRequest(urlRequest: try! urlRequest.asURLRequest())
    }
    
    // TODO: Add support for more Alamofire API's
}
