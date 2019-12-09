//
//  HistoryViewController.swift
//  VIPERSBCoreData
//
//  Created Кирилл Лукьянов on 17.11.2019.
//  Copyright © 2019 Кирилл Лукьянов. All rights reserved.

import UIKit

class HistoryViewController: UIViewController, HistoryViewProtocol {
    @IBOutlet weak var tableView: UITableView!
    var presenter: HistoryPresenterProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.initializeFetchedResultsController()
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

}

extension HistoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell = UITableViewCell(style: .value1, reuseIdentifier: "cell")
        cell.textLabel?.text = presenter?.getObjects(index: indexPath).text
        cell.detailTextLabel?.text = presenter?.getObjects(index: indexPath).source
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter?.numberOfSection() ?? 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter!.numberOfRowsInSection(section: section)
    }
}
