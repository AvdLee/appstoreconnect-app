//
//  TestFlightMenuViewController.swift
//  AppStoreConnect
//
//  Created by Antoine van der Lee on 30/11/2018.
//  Copyright © 2018 SwiftLee. All rights reserved.
//

import Cocoa
import AppStoreConnect_Swift_SDK

final class TestFlightMenuViewController: NSViewController {

    @IBOutlet private weak var tableView: NSTableView!

    var viewModel: TestFlightMenuViewModel? {
        didSet {
            viewModel?.update(using: self)
        }
    }

    var didSelectBetaGroup: ((_ betaGroup: BetaGroup?, _ betaTesters: [BetaTester]) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.widthAnchor.constraint(equalToConstant: 220).isActive = true
    }
    
}

extension TestFlightMenuViewController: NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return viewModel?.numberOfItems() ?? 0
    }
}

extension TestFlightMenuViewController: NSTableViewDelegate {
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let viewModel = viewModel else { return nil }
        var result: AppMenuTableCellView
        result = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as! AppMenuTableCellView
        result.appNameLabel.stringValue = viewModel.titleOfItem(for: row)
        return result
    }

    func tableViewSelectionDidChange(_ notification: Notification) {
        guard let viewModel = viewModel else { return }
        if tableView.selectedRow == 0 {
            didSelectBetaGroup?(nil, viewModel.betaTesters)
        } else {
            let betaGroup = viewModel.betaGroups[tableView.selectedRow - 1]
            let betaTesters = viewModel.betaTesters.filter { betaTester in
                return betaGroup.relationships?.betaTesters?.data?.contains(where: { $0.id == betaTester.id }) == true
            }

            didSelectBetaGroup?(betaGroup, betaTesters)
        }
    }
}

extension TestFlightMenuViewController: TestFlightMenuViewModelDelegate {
    func didLoadAllGroups() {
        tableView.reloadData()

        if tableView.selectedRowIndexes.isEmpty {
            tableView.selectRowIndexes(IndexSet(integer: 0), byExtendingSelection: false)
        }
    }

    func didLoadAllUsers() {
        tableView.reloadData()

        if tableView.selectedRowIndexes.isEmpty {
            tableView.selectRowIndexes(IndexSet(integer: 0), byExtendingSelection: false)
        }
    }
}
