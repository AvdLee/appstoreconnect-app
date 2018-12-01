//
//  MenuViewController.swift
//  AppStoreConnect
//
//  Created by Antoine van der Lee on 30/11/2018.
//  Copyright © 2018 SwiftLee. All rights reserved.
//

import Cocoa
import AppStoreConnect_Swift_SDK

extension APIProvider {
    static var shared: APIProvider?
    
    convenience init(secrets: Secrets) {
        let apiConfiguration = APIConfiguration(issuerID: secrets.issuerID, privateKeyID: secrets.privateKeyID, privateKey: secrets.privateKey)
        self.init(configuration: apiConfiguration)
    }
    
    static func configure(with secrets: Secrets) {
        APIProvider.shared = APIProvider(secrets: secrets)
        guard let splitViewController = AppDelegate.visibleViewController as? MainSplitViewController,
            let menuViewController = splitViewController.splitViewItems.first?.viewController as? MenuViewController else {
            return
        }
        
        menuViewController.reset()
    }
}

final class MenuViewController: NSViewController {

    @IBOutlet private weak var tableView: NSTableView!

    private var apps: [App]? {
        didSet {
            tableView.reloadData()
        }
    }

    var didSelectApp: ((_ app: App) -> Void)?
    
    func reset() {
        APIProvider.shared?.request(.apps()) { [weak self] (result) in
            DispatchQueue.main.async {
                self?.apps = result.value?.data.sortByName()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        reset()
        view.widthAnchor.constraint(equalToConstant: 200).isActive = true
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

    func tableViewSelectionDidChange(_ notification: Notification) {
        let table = notification.object as! NSTableView
        guard let app = apps?[table.selectedRow] else { return }
        didSelectApp?(app)
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
