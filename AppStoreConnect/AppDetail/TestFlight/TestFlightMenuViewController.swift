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
            viewModel?.update { [weak self] in
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
        }
    }

    var didSelectBetaTesters: ((_ betaTesters: BetaTestersResponse) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
}

extension TestFlightMenuViewController: NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return 1
    }
}

extension TestFlightMenuViewController: NSTableViewDelegate {
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let viewModel = viewModel else { return nil }
        var result: AppMenuTableCellView
        result = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as! AppMenuTableCellView
        result.appNameLabel.stringValue = "All Testers (\(viewModel.totalNumberOfTesters))"
        return result
    }

    func tableViewSelectionDidChange(_ notification: Notification) {
        guard let betaTesters = viewModel?.betaTestersInfo else { return }
        didSelectBetaTesters?(betaTesters)
    }
}
