//
//  AppDetailViewController.swift
//  AppStoreConnect
//
//  Created by Antoine van der Lee on 30/11/2018.
//  Copyright © 2018 SwiftLee. All rights reserved.
//

import Cocoa
import AppStoreConnect_Swift_SDK

struct AppDetailViewModel {
    let app: App

    var title: String? {
        return self.app.attributes?.name
    }
}

final class AppDetailViewController: NSViewController {

    @IBOutlet private weak var appTitleLabel: NSTextField!

    var viewModel: AppDetailViewModel? {
        didSet {
            appTitleLabel.stringValue = viewModel?.title ?? ""
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
}
