//
//  MenuViewController.swift
//  AppStoreConnect
//
//  Created by Antoine van der Lee on 30/11/2018.
//  Copyright © 2018 SwiftLee. All rights reserved.
//

import Cocoa
import AppStoreConnect_Swift_SDK

final class MenuViewController: NSViewController {

    @IBOutlet weak var tableView: NSTableView!
    private let provider = APIProvider(configuration: APIConfiguration.testConfiguration)
    private var apps: [App]? {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        provider.request(.apps()) { [weak self] (result) in
            DispatchQueue.main.async {
                self?.apps = result.value?.data.sortByName()
            }
        }
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

extension MenuViewController: NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return apps?.count ?? 0
    }
}

extension MenuViewController: NSTableViewDelegate {
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView?{
        var result: AppMenuTableCellView
        result = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as! AppMenuTableCellView
        result.appNameLabel.stringValue = apps?[row].attributes?.name ?? "Unknown name"
        return result
    }
}

extension Collection where Element == App {
    func sortByName() -> [Element] {
        return sorted(by: { (lhs, rhs) -> Bool in
            guard let lhsName = lhs.attributes?.name, let rhsName = rhs.attributes?.name else { return false }
            return lhsName < rhsName
        })
    }
}
