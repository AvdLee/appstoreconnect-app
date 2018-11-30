//
//  BetaTestersViewController.swift
//  AppStoreConnect
//
//  Created by Antoine van der Lee on 01/12/2018.
//  Copyright © 2018 SwiftLee. All rights reserved.
//

import Cocoa

final class BetaTestersViewController: NSViewController {

    @IBOutlet weak var titleLabel: NSTextField!
    let viewModel: BetaTestersViewModel

    required init(viewModel: BetaTestersViewModel) {
        self.viewModel = viewModel

        super.init(nibName: "BetaTestersViewController", bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }

    private func updateViews() {
        titleLabel.stringValue = viewModel.title
    }

}
