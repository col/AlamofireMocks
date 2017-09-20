//
//  Dictionary.swift
//  AlamofireMocks
//
//  Created by Col Harris on 20/09/2017.
//  Copyright © 2017 Colin Harris. All rights reserved.
//

import Foundation

extension Dictionary where Key == String, Value: Any {
    
    func contains(_ subset: [String: Any]) -> Bool {
        let filtered = self.filter { key, _ -> Bool in
            return subset.keys.contains(key)
        }
        var filteredDict = [String: Any]()
        for result in filtered {
            filteredDict[result.0] = result.1
        }
        return filteredDict == subset
    }
    
}

public func ==(lhs: [String: Any], rhs: [String: Any]) -> Bool {
    return NSDictionary(dictionary: lhs).isEqual(to: rhs)
}
