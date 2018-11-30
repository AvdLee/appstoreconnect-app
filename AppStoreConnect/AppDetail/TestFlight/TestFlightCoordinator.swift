//
//  TestFlightCoordinator.swift
//  AppStoreConnect
//
//  Created by Antoine van der Lee on 30/11/2018.
//  Copyright © 2018 SwiftLee. All rights reserved.
//

import Foundation
import AppKit
import AppStoreConnect_Swift_SDK

final class TestFlightCoordinator {

    private let app: App

    init(app: App) {
        self.app = app
    }

    func start(tabBarController: NSSplitViewController) {
        let testFlightMenuViewController = tabBarController.children.first as! TestFlightMenuViewController
    }

}
