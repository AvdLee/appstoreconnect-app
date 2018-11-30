//
//  MainSplitViewController.swift
//  AppStoreConnect
//
//  Created by Antoine van der Lee on 30/11/2018.
//  Copyright © 2018 SwiftLee. All rights reserved.
//

import Cocoa

final class MainSplitViewController: NSSplitViewController {

    private var menuViewController: MenuViewController!
    private var appDetailViewController: AppDetailViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        menuViewController = (children[0] as! MenuViewController)
        appDetailViewController = (children[1] as! AppDetailViewController)
        menuViewController.didSelectApp = { [weak self] app in
            print("Did select app \(String(describing: app.attributes?.name))")
            self?.appDetailViewController.viewModel = AppDetailViewModel(app: app)
        }
    }

}
