//
//  AddTestFlightUserViewController.swift
//  AppStoreConnect
//
//  Created by Antoine van der Lee on 10/12/2018.
//  Copyright © 2018 SwiftLee. All rights reserved.
//

import Cocoa
import AppStoreConnect_Swift_SDK

final class AddTestFlightUserViewController: NSViewController {

    @IBOutlet weak var emailTextField: NSTextField!
    @IBOutlet weak var firstNameTextField: NSTextField!
    @IBOutlet weak var lastNameTextField: NSTextField!
    @IBOutlet weak var addButton: NSButton!

    private let betaGroup: BetaGroup

    required init(betaGroup: BetaGroup) {
        self.betaGroup = betaGroup

        super.init(nibName: "AddTestFlightUserViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func addButtonTapped(_ sender: NSButton) {
        dismiss(self)
        APIProvider.shared.request(APIEndpoint.create(betaTesterWithEmail: emailTextField.stringValue, firstName: firstNameTextField.stringValue, lastName: lastNameTextField.stringValue, betaGroupIds: [betaGroup.id])) { (result) in
            switch result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print("Adding failed with \(error)")
            }
        }
    }
}

extension AddTestFlightUserViewController: NSTextFieldDelegate {

    func controlTextDidChange(_ obj: Notification) {
        addButton.isEnabled = emailTextField.stringValue.isValidEmail()
    }
}

extension String {
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailValidation = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailValidation.evaluate(with: self)
    }
}
