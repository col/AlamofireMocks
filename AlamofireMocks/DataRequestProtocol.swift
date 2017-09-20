//
//  DataRequestProtocol.swift
//  AlamofireMocks
//
//  Created by Colin HARRIS on 9/20/17.
//  Copyright © 2017 Colin Harris. All rights reserved.
//

import Foundation
import Alamofire

protocol DataRequestProtocol {
    
    @discardableResult
    func responseJSON(queue: DispatchQueue?,
                      options: JSONSerialization.ReadingOptions,
                      completionHandler: @escaping (DataResponse<Any>) -> Void) -> Self
    
}

extension DataRequestProtocol {
    
    @discardableResult
    func responseJSON(queue: DispatchQueue? = nil,
                      options: JSONSerialization.ReadingOptions = .allowFragments,
                      completionHandler: @escaping (DataResponse<Any>) -> Void) -> Self {
        
        return responseJSON(queue: queue, options: options, completionHandler: completionHandler)
    }
    
}

extension DataRequest: DataRequestProtocol {
    
}
