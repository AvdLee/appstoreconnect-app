//
//  TestFlightMenuViewModel.swift
//  AppStoreConnect
//
//  Created by Antoine van der Lee on 30/11/2018.
//  Copyright © 2018 SwiftLee. All rights reserved.
//

import Foundation
import AppStoreConnect_Swift_SDK

protocol TestFlightMenuViewModelDelegate: class {
    func didLoadAllUsers()
    func didLoadAllGroups()
}

final class TestFlightMenuViewModel {

    private let app: App
    private(set) var betaTesters: [BetaTester] = []
    private(set) var betaGroups: [BetaGroup] = []

    weak var delegate: TestFlightMenuViewModelDelegate?

    var totalNumberOfTesters: Int = 0

    init(app: App) {
        self.app = app
    }

    func update(using delegate: TestFlightMenuViewModelDelegate) {
        self.delegate = delegate
        fetchTesters(with: nil)
    }

    func numberOfItems() -> Int {
        guard !betaTesters.isEmpty && !betaGroups.isEmpty else { return 0 }
        return 1 + betaGroups.count
    }

    func titleOfItem(for row: Int) -> String {
        if row == 0 {
            return "All Testers (\(totalNumberOfTesters))"
        } else {
            return betaGroups[row - 1].attributes?.name ?? "-"
        }
    }
}

extension TestFlightMenuViewModel {
    private func fetchTesters(with next: PagedDocumentLinks?) {
        let filters = [ListBetaTesters.Filter.apps([app.id])]
        let limit = [ListBetaTesters.Limit.betaTesters(200)]
        let sort = [ListBetaTesters.Sort.emailAscending]
        
        APIProvider.shared.request(.betaTesters(filter: filters, limit: limit, sort: sort, next: next)) { [weak self] (result) in
            guard let betaTestersInfo = result.value else { return }
            self?.totalNumberOfTesters = betaTestersInfo.meta?.paging.total ?? 0
            self?.betaTesters.append(contentsOf: betaTestersInfo.data)

            if self?.betaTesters.count != self?.totalNumberOfTesters {
                self?.fetchTesters(with: betaTestersInfo.links)
            } else {
                DispatchQueue.main.async {
                    self?.delegate?.didLoadAllUsers()
                }
            }
        }

        APIProvider.shared.request(APIEndpoint.betaGroups(filter: [ListBetaGroups.Filter.app([self.app.id])])) { [weak self] (result) in
            guard let groups = result.value else { return }
            self?.betaGroups = groups.data
            
            DispatchQueue.main.async {
                self?.delegate?.didLoadAllGroups()
            }
        }
    }

}
