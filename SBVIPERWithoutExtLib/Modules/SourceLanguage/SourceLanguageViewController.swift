//
//  SourceLanguageViewController.swift
//  VIPERSBCoreData
//
//  Created Кирилл Лукьянов on 17.11.2019.
//  Copyright © 2019 Кирилл Лукьянов. All rights reserved.

import UIKit

class SourceLanguageViewController: UIViewController, SourceLanguageViewProtocol {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.register(SourceLanguageTableViewCell.self, forCellReuseIdentifier: "cell")

        }
    }
    var presenter: SourceLanguagePresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAutoLayoutTableView()
    }

    fileprivate func setupAutoLayoutTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}

extension SourceLanguageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let list = presenter?.getLanguageList() ?? []
        return list.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "cell",
                                                  for: indexPath) as? SourceLanguageTableViewCell

        let list = presenter?.getLanguageList() ?? []
        cell?.language.text = list[indexPath.row]
        return cell ?? UITableViewCell()
    }

}
