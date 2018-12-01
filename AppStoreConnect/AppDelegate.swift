//
//  AppDelegate.swift
//  AppStoreConnect
//
//  Created by Antoine van der Lee on 30/11/2018.
//  Copyright © 2018 SwiftLee. All rights reserved.
//

import Cocoa
import AppStoreConnect_Swift_SDK

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        guard let secrets = Secrets.storedSecrets() else {
            AppDelegate.presentSettings()
            return
        }
        
        APIProvider.configure(with: secrets)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    static var visibleViewController: NSViewController? {
        let window = NSApplication.shared.keyWindow
        let visibleViewController = window?.contentViewController
        return visibleViewController
    }
    
    static func presentSettings() {
        let storyBoard = NSStoryboard(name: "Main", bundle: nil) as NSStoryboard
        let settingsViewController = storyBoard.instantiateController(withIdentifier: "Settings") as! NSViewController
        
        AppDelegate.visibleViewController?.presentAsSheet(settingsViewController)
    }

}

