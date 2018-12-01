//
//  Secrets.swift
//  AppStoreConnect
//
//  Created by Boris Emorine on 11/30/18.
//  Copyright © 2018 SwiftLee. All rights reserved.
//

import Cocoa
import Foundation
import Security

struct Secrets {
    
    let issuerID: String
    let privateKeyID: String
    let privateKey: String
    
    private static let issuerIDKey = "issuer_id_key"
    private static let privateKeyIDKey = "private_key_id_key"
    private static let privateKeyKey = "private_key_key"
    
    static func storedSecrets() -> Secrets? {
        let defaults = UserDefaults.standard

        guard let issuesID = defaults.object(forKey: issuerIDKey) as? String,
            let privateKeyID = defaults.object(forKey: privateKeyIDKey) as? String,
            let privateKey = defaults.object(forKey: privateKeyKey) as? String else {
                return nil
        }

        return Secrets(issuerID: issuesID, privateKeyID: privateKeyID, privateKey: privateKey)
    }
    
    func store() {
        let defaults = UserDefaults.standard
        defaults.set(issuerID, forKey: Secrets.issuerIDKey)
        defaults.set(privateKey, forKey: Secrets.privateKeyKey)
        defaults.set(privateKeyID, forKey: Secrets.privateKeyIDKey)
        
        defaults.synchronize()
    }
    
}
