//
//  Secrets.swift
//  AppStoreConnect
//
//  Created by Boris Emorine on 11/30/18.
//  Copyright © 2018 SwiftLee. All rights reserved.
//

import Foundation
import Security

struct Secrets {
    
    let issuerID: String
    let privateKeyID: String
    let privateKey: String
    
    func store() {
        // TODO: Store in keychain
    }
}
