//
//  MenuCoordinator.swift
//  AppStoreConnect
//
//  Created by Antoine van der Lee on 30/11/2018.
//  Copyright © 2018 SwiftLee. All rights reserved.
//

import Foundation
import AppKit

final class MenuCoordinator {

    let menuViewController: MenuViewController

    init(menuViewController: MenuViewController) {
        self.menuViewController = menuViewController

        menuViewController.didSelectApp = { app in
            print("Did select app \(app)")
        }
    }

}
