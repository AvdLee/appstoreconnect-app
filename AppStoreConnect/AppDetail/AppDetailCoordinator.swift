//
//  AppDetailCoordinator.swift
//  AppStoreConnect
//
//  Created by Antoine van der Lee on 30/11/2018.
//  Copyright © 2018 SwiftLee. All rights reserved.
//

import Foundation
import AppStoreConnect_Swift_SDK
import AppKit

final class AppDetailCoordinator {

    private let app: App

    init(app: App) {
        self.app = app
    }

    func start(tabBarController: NSTabViewController) {
        let appDetailViewController: AppDetailViewController = tabBarController.children.first as! AppDetailViewController
        appDetailViewController.viewModel = AppDetailViewModel(app: app)

        let testFlightSplitViewController: TestFlightSplitViewController = tabBarController.children[1] as! TestFlightSplitViewController
        let coordinator = TestFlightCoordinator(app: app)
        coordinator.start(splitViewController: testFlightSplitViewController)
    }
}
