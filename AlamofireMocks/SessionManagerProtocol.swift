//
//  SessionManagerProtocol.swift
//  AlamofireEmbeddedMocks
//
//  Created by Colin HARRIS on 9/20/17.
//  Copyright © 2017 Colin Harris. All rights reserved.
//

import Foundation
import Alamofire

public protocol SessionManagerProtocol {
    
    @discardableResult
    func request(_ url: URLConvertible, method: HTTPMethod, parameters: Parameters?,
                 encoding: ParameterEncoding, headers: HTTPHeaders?)  -> DataRequestProtocol
    
    func request(_ urlRequest: URLRequestConvertible) -> DataRequestProtocol
    
}

public extension SessionManagerProtocol {
    
    @discardableResult
    public func request(
        _ url: URLConvertible,
        method: HTTPMethod = .get,
        parameters: Parameters? = nil,
        encoding: ParameterEncoding = URLEncoding.default,
        headers: HTTPHeaders? = nil) -> DataRequestProtocol {
        
        return request(url, method: method, parameters: parameters, encoding: encoding, headers: headers)
    }
}

extension SessionManager: SessionManagerProtocol {
    
    @discardableResult
    public func request(_ url: URLConvertible, method: HTTPMethod, parameters: Parameters?,
                 encoding: ParameterEncoding, headers: HTTPHeaders?)  -> DataRequestProtocol {
        let dataRequest: DataRequest = request(url, method: method, parameters: parameters, encoding: encoding, headers: headers)
        return dataRequest as DataRequestProtocol
    }
    
    public func request(_ urlRequest: URLRequestConvertible) -> DataRequestProtocol {
        let dataRequest: DataRequest = request(urlRequest)
        return dataRequest as DataRequestProtocol
    }
}
