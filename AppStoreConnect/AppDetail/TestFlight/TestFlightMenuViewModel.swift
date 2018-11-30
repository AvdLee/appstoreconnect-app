//
//  TestFlightMenuViewModel.swift
//  AppStoreConnect
//
//  Created by Antoine van der Lee on 30/11/2018.
//  Copyright © 2018 SwiftLee. All rights reserved.
//

import Foundation
import AppStoreConnect_Swift_SDK

final class TestFlightMenuViewModel {

    private let app: App
    var betaTestersInfo: BetaTestersResponse?

    var totalNumberOfTesters: Int {
        return betaTestersInfo?.meta?.paging.total ?? 0
    }

    init(app: App) {
        self.app = app
    }

    func update(then completion: @escaping () -> Void) {
        APIProvider.shared.request(.betaTesters(filter: [ListBetaTesters.Filter.apps([app.id])])) { [weak self] (result) in
            self?.betaTestersInfo = result.value
            completion()
        }
    }

}
