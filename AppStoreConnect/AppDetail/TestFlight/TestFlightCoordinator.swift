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

    func start(splitViewController: NSSplitViewController) {
        let testFlightMenuViewController = splitViewController.children.first as! TestFlightMenuViewController
        let viewModel = TestFlightMenuViewModel(app: app)
        testFlightMenuViewController.viewModel = viewModel

        testFlightMenuViewController.didSelectBetaTesters = { betaTesters in
            splitViewController.children.remove(at: 1)
            let viewModel = BetaTestersViewModel(betaTesters: betaTesters)
            let betaTestersViewController = BetaTestersViewController(viewModel: viewModel)
            splitViewController.addChild(betaTestersViewController)
        }
    }

}
