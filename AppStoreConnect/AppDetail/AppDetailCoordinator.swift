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
        let testFlightSplitViewController: TestFlightSplitViewController = tabBarController.children[0] as! TestFlightSplitViewController
        let coordinator = TestFlightCoordinator(app: app)
        coordinator.start(splitViewController: testFlightSplitViewController)
    }
}
