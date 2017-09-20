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

    @IBOutlet weak var serviceField: UITextField!
    @IBOutlet weak var responseTextArea: UITextView!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var sessionTypeControl: UISegmentedControl!

    let alamofireSessionManager = Alamofire.SessionManager.default
    let mockSessionManager = MockSessionManager()

    var selectedSessionManager: SessionManagerProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
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
        selectedSessionManager.request("https://httpbin.org/get").responseJSON { response in
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
