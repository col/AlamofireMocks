//
//  ResponseStore.swift
//  AlamofireMocks
//
//  Created by Col Harris on 20/09/2017.
//  Copyright © 2017 Colin Harris. All rights reserved.
//

import Foundation
import Alamofire

public protocol ResponseStore {
    
    func data(for: URLRequest) -> Data
    
    func data(for: URL, withParameters params: Parameters?) -> Data
    
}
