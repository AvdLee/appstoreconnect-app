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

    private let betaTestersResponse: BetaTestersResponse

    var title: String {
        return "All testers \(totalNumberOfTesters)"
    }

    var totalNumberOfTesters: Int {
        return self.betaTestersResponse.meta?.paging.total ?? 0
    }

    init(betaTestersResponse: BetaTestersResponse) {
        self.betaTestersResponse = betaTestersResponse
    }

    func betaTester(for row: Int) -> BetaTester? {
        guard row < betaTestersResponse.data.count else { return nil }
        return betaTestersResponse.data[row]
    }

}
