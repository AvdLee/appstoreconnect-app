//
//  TestFlightMenuViewController.swift
//  AppStoreConnect
//
//  Created by Antoine van der Lee on 30/11/2018.
//  Copyright © 2018 SwiftLee. All rights reserved.
//

import Cocoa

final class TestFlightMenuViewController: NSViewController {

    var viewModel: TestFlightMenuViewModel? {
        didSet {

        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
}
