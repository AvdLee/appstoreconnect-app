//
//  MenuFlowCoordinator.swift
//  AppStoreConnect
//
//  Created by Antoine van der Lee on 08/12/2018.
//  Copyright © 2018 SwiftLee. All rights reserved.
//

import Foundation
import AppKit

final class MenuFlowCoordinator {

    private let menuViewController: MenuViewController
    private var appDetailCoordinator: AppDetailCoordinator?
    
    public init(menuViewController: MenuViewController) {
        self.menuViewController = menuViewController
    }

    func start() {
        menuViewController.didSelectApp = { [weak self] app in
            print("Did select app \(String(describing: app.attributes?.name))")

            let tabBarController = NSStoryboard(name: "Main", bundle: nil).instantiateController(withIdentifier: "DetailTabViewController") as! NSTabViewController
            NSApplication.shared.keyWindow?.contentViewController = tabBarController

            self?.appDetailCoordinator = AppDetailCoordinator(app: app)
            self?.appDetailCoordinator?.start(tabBarController: tabBarController)

        }
    }

}
