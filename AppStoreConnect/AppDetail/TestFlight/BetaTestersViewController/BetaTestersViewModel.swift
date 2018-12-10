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

    let betaGroup: BetaGroup?
    private let allBetaTesters: [BetaTester]
    private var filteredBetaTesters: [BetaTester]

    var title: String {
        return "All testers (\(allBetaTesters.count))"
    }

    var totalNumberOfTesters: Int {
        return filteredBetaTesters.count
    }

    var canAddNewUser: Bool {
        return betaGroup != nil
    }

    init(betaGroup: BetaGroup?, betaTesters: [BetaTester]) {
        self.betaGroup = betaGroup
        self.allBetaTesters = betaTesters
        self.filteredBetaTesters = betaTesters
    }

    func betaTester(for row: Int) -> BetaTester? {
        guard row < filteredBetaTesters.count else { return nil }
        return filteredBetaTesters[row]
    }

    func applyFilter(with searchInput: String, then completion: () -> Void) {
        guard !searchInput.isEmpty else {
            filteredBetaTesters = allBetaTesters
            completion()
            return
        }
        
        filteredBetaTesters = allBetaTesters.filter({ (tester) -> Bool in
            return [tester.attributes?.email, tester.attributes?.firstName, tester.attributes?.lastName].contains(where: { $0?.contains(searchInput) == true }) == true
        })
        completion()
    }

}
