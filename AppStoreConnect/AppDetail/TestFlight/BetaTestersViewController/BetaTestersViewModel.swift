//
//  BetaTestersViewModel.swift
//  AppStoreConnect
//
//  Created by Antoine van der Lee on 01/12/2018.
//  Copyright © 2018 SwiftLee. All rights reserved.
//

import Foundation
import AppStoreConnect_Swift_SDK

final class BetaTestersViewModel {

    private let betaTesters: [BetaTester]

    var title: String {
        return "All testers (\(betaTesters.count))"
    }

    var totalNumberOfTesters: Int {
        return betaTesters.count
    }

    init(betaTesters: [BetaTester]) {
        self.betaTesters = betaTesters
    }

    func betaTester(for row: Int) -> BetaTester? {
        guard row < betaTesters.count else { return nil }
        return betaTesters[row]
    }

}
