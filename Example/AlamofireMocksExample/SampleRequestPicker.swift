//
//  SampleRequestPicker.swift
//  AlamofireMocksExample
//
//  Created by Col Harris on 21/09/2017.
//  Copyright © 2017 Colin Harris. All rights reserved.
//

import UIKit
import Alamofire

struct SampleRequest {
    let url: String
    let method: HTTPMethod
    let params: Parameters?
    
    func displayString() -> String {
        let paramsString = params != nil ? String(describing: params!) : ""
        return "\(method.rawValue) \(url) \(paramsString)"
    }
}

protocol SampleRequestPickerDelegate: class {
    func didSelect(sampleRequest: SampleRequest)
}

class SampleRequestPicker: NSObject, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let requests: [SampleRequest]
    weak var delegate: SampleRequestPickerDelegate?
    
    init(requests: [SampleRequest], delegate: SampleRequestPickerDelegate) {
        self.requests = requests
        self.delegate = delegate
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return requests.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let request = requests[row]
        return request.displayString()
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        delegate?.didSelect(sampleRequest: requests[row])
    }
}
