//
//  ViewController.swift
//  EmbeddedMocksExample
//
//  Created by Colin HARRIS on 9/19/17.
//  Copyright © 2017 Colin Harris. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireMocks

class ViewController: UIViewController {

    @IBOutlet weak var requestField: UITextField!
    @IBOutlet weak var responseTextArea: UITextView!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var sessionTypeControl: UISegmentedControl!
    
    var sampleRequestPicker: SampleRequestPicker!
    var requestPickerView: UIPickerView!
    var selectedRequest: SampleRequest!
    
    let alamofireSessionManager = Alamofire.SessionManager.default
    let mockSessionManager = MockSessionManager()
    var selectedSessionManager: SessionManagerProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        sampleRequestPicker = SampleRequestPicker(
            requests: [
                SampleRequest(url: "https://httpbin.org/get", method: .get, params: nil),
                SampleRequest(url: "https://httpbin.org/post", method: .post, params: nil),
                SampleRequest(url: "https://httpbin.org/post", method: .post, params: ["key": "apples"])
            ],
            delegate: self
        )
        
        requestPickerView = UIPickerView()
        requestPickerView.dataSource = sampleRequestPicker
        requestPickerView.delegate = sampleRequestPicker
        requestField.inputView = requestPickerView
        didSelect(sampleRequest: sampleRequestPicker.requests.first!)
        
        submitButton.setTitle("Loading...", for: .disabled)
        submitButton.setTitle("Submit", for: .normal)

        selectedSessionManager = alamofireSessionManager
    }

    @IBAction
    func sessionManagerSelectionChanged() {
        if sessionTypeControl.selectedSegmentIndex == 0 {
            selectedSessionManager = alamofireSessionManager
        } else {
            selectedSessionManager = mockSessionManager
        }
    }

    @IBAction
    func submitClicked() {
        disableSubmitButton()
        selectedSessionManager.request(selectedRequest.url, method: selectedRequest.method,
                                       parameters: selectedRequest.params).responseJSON { response in
            self.enableSubmitButton()

            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                self.responseTextArea.text = utf8Text
            } else {
                self.responseTextArea.text = response.error?.localizedDescription
            }
        }
    }

    private func disableSubmitButton() {
        submitButton.isEnabled = false
        sessionTypeControl.isEnabled = false
    }

    private func enableSubmitButton() {
        submitButton.isEnabled = true
        sessionTypeControl.isEnabled = true
    }
}

extension ViewController: SampleRequestPickerDelegate {
    
    func didSelect(sampleRequest: SampleRequest) {
        selectedRequest = sampleRequest
        requestField.text = selectedRequest?.displayString()
        requestField.resignFirstResponder()
    }
}
