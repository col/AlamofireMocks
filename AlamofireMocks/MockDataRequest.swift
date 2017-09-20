//
//  MockDataRequest.swift
//  AlamofireEmbeddedMocks
//
//  Created by Colin HARRIS on 9/20/17.
//  Copyright © 2017 Colin Harris. All rights reserved.
//

import Foundation
import Alamofire

class MockDataRequest: DataRequestProtocol {
    
    init(urlRequest: URLRequestConvertible) {
        // TODO: Use the url request to look up the correct mock
    }
    
    init(url: URL,
         method: HTTPMethod,
         parameters: Parameters?,
         headers: HTTPHeaders?) {
        // TODO: Use the params to look up the correct mock
    }
    
    @discardableResult
    func responseJSON(queue: DispatchQueue?,
                      options: JSONSerialization.ReadingOptions,
                      completionHandler: @escaping (DataResponse<Any>) -> Void) -> Self {
        
        let data = "{ \"key\": \"value\" }".data(using: .utf8)!
        let result = Result {
            return try JSONSerialization.jsonObject(with: data, options: options)
        }
        let dataResponse = DataResponse(request: nil, response: nil, data: data, result: result)
        completionHandler(dataResponse)
        return self
    }
    
    // TODO: Add support for more response handlers
}
