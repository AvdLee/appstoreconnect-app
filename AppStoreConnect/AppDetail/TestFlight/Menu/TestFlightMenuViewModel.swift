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
    private(set) var betaTesters: [BetaTester] = []

    var totalNumberOfTesters: Int = 0

    init(app: App) {
        self.app = app
    }

    func update(then completion: @escaping () -> Void) {
        fetchTesters(with: nil, completion: completion)
    }

    private func fetchTesters(with next: PagedDocumentLinks?, completion: @escaping () -> Void) {
        let filters = [ListBetaTesters.Filter.apps([app.id])]
        let limit = [ListBetaTesters.Limit.betaTesters(50)]
        let sort = [ListBetaTesters.Sort.emailAscending]
        
        APIProvider.shared.request(.betaTesters(filter: filters, limit: limit, sort: sort, next: next)) { [weak self] (result) in
            guard let betaTestersInfo = result.value else { return }
            self?.totalNumberOfTesters = betaTestersInfo.meta?.paging.total ?? 0
            self?.betaTesters.append(contentsOf: betaTestersInfo.data)

            if self?.betaTesters.count != self?.totalNumberOfTesters {
                self?.fetchTesters(with: betaTestersInfo.links, completion: completion)
            } else {
                completion()
            }
        }
    }

}
