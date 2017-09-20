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
    
    let data: Data
    
    init(data: Data) {
        self.data = data
    }
    
    @discardableResult
    func responseJSON(queue: DispatchQueue?,
                      options: JSONSerialization.ReadingOptions,
                      completionHandler: @escaping (DataResponse<Any>) -> Void) -> Self {
        
        let result = Result {
            return try JSONSerialization.jsonObject(with: data, options: options)
        }
        let dataResponse = DataResponse(request: nil, response: nil, data: data, result: result)
        completionHandler(dataResponse)
        return self
    }
    
    // TODO: Add support for more response handlers
}
