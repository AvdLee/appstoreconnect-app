//
//  MainSplitViewController.swift
//  AppStoreConnect
//
//  Created by Antoine van der Lee on 30/11/2018.
//  Copyright © 2018 SwiftLee. All rights reserved.
//

import Cocoa
import AppKit

final class MainSplitViewController: NSSplitViewController {

    private var menuViewController: MenuViewController!
    private var detailTabBarController: NSTabViewController!

    private var appDetailCoordinator: AppDetailCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        menuViewController = (children[0] as! MenuViewController)
        detailTabBarController = (children[1] as! NSTabViewController)

        menuViewController.didSelectApp = { [weak self] app in
            print("Did select app \(String(describing: app.attributes?.name))")
            self?.appDetailCoordinator = AppDetailCoordinator(app: app)
            self?.appDetailCoordinator?.start(tabBarController: self!.detailTabBarController)
            
        }
    }

    override func splitView(_ splitView: NSSplitView, effectiveRect proposedEffectiveRect: NSRect, forDrawnRect drawnRect: NSRect, ofDividerAt dividerIndex: Int) -> NSRect {
        return NSZeroRect
    }
}
