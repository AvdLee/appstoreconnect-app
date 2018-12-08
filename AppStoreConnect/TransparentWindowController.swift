//
//  TransparentWindowController.swift
//  AppStoreConnect
//
//  Created by Antoine van der Lee on 30/11/2018.
//  Copyright © 2018 SwiftLee. All rights reserved.
//

import Cocoa

final class TransparentWindowController: NSWindowController {

    private var menuFlowCoordinator: MenuFlowCoordinator?

    override func windowDidLoad() {
        super.windowDidLoad()

//        window?.titleVisibility = .hidden
        window?.styleMask = [.closable, .titled, .miniaturizable, .resizable, .fullSizeContentView]
        window?.title = "App Store Connect"
        window?.identifier = .mainWindow
        window?.minSize = NSSize(width: 1060, height: 700)
        window?.center()

        let menuViewController = contentViewController as! MenuViewController
        menuFlowCoordinator = MenuFlowCoordinator(menuViewController: menuViewController)
        menuFlowCoordinator?.start()
    }

}

extension NSUserInterfaceItemIdentifier {

    static let mainWindow = NSUserInterfaceItemIdentifier(rawValue: "main")
}
