//
//  SettingsViewController.swift
//  AppStoreConnect
//
//  Created by Boris Emorine on 11/30/18.
//  Copyright © 2018 SwiftLee. All rights reserved.
//

import Cocoa

class SettingsViewController: NSViewController, NSTextFieldDelegate {

    @IBOutlet weak var issuerIDTextField: NSTextField!
    @IBOutlet weak var privateKeyIDTextField: NSTextField!
    @IBOutlet weak var privateKeyTextField: NSTextField!
    @IBOutlet weak var doneButton: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    
    @IBAction func handleTapDone(_ sender: NSButton) {
        let secret = Secrets(issuerID: issuerIDTextField.stringValue, privateKeyID: privateKeyIDTextField.stringValue, privateKey: privateKeyTextField.stringValue)
        secret.store()
    }
    
    func controlTextDidChange(_ obj: Notification) {
        doneButton.isEnabled = shouldActivateDoneButton()
    }
    
    private func shouldActivateDoneButton() -> Bool {
        return issuerIDTextField.stringValue.count > 0 &&
        privateKeyTextField.stringValue.count > 0 &&
        privateKeyIDTextField.stringValue.count > 0
    }
    
}
