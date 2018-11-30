//
//  TransparentWindowController.swift
//  AppStoreConnect
//
//  Created by Antoine van der Lee on 30/11/2018.
//  Copyright © 2018 SwiftLee. All rights reserved.
//

import Cocoa

final class TransparentWindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
    
        window?.titlebarAppearsTransparent = true
        window?.titleVisibility = .hidden
        window?.styleMask = [.closable, .titled, .miniaturizable, .resizable, .fullSizeContentView]
    }

}
