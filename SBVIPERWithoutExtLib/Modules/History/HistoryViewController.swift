//
//  HistoryViewController.swift
//  VIPERSBCoreData
//
//  Created Кирилл Лукьянов on 17.11.2019.
//  Copyright © 2019 Кирилл Лукьянов. All rights reserved.


import UIKit
import CoreData

class HistoryViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var presenter: HistoryPresenterProtocol?
    var fetchedResultsController: NSFetchedResultsController<Translate>!
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeFetchedResultsController()
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    func initializeFetchedResultsController() {
        let request: NSFetchRequest<Translate> = Translate.fetchRequest()
        let text = NSSortDescriptor(key: #keyPath(Translate.text), ascending: true)
        request.sortDescriptors = [text]
        let dataController = CoreDataService()
        fetchedResultsController = NSFetchedResultsController(fetchRequest: request,
                                                              managedObjectContext: dataController.mainContext,
                                                              sectionNameKeyPath: nil,
                                                              cacheName: nil)
        do {
            try fetchedResultsController.performFetch()
        } catch {
            fatalError("Failed to initialize FetchedResultsController: \(error)")
        }
    }
}

extension HistoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell = UITableViewCell(style: .value1, reuseIdentifier: "cell")
        guard let object = self.fetchedResultsController?.object(at: indexPath) else {
            fatalError("Attempt to configure cell without a managed object")
        }
        cell.textLabel?.text = object.text
        cell.detailTextLabel?.text = object.source
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return fetchedResultsController.sections?.count ?? 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sections = fetchedResultsController.sections else {
            fatalError("No sections in fetchedResultsController")
        }
        let sectionInfo = sections[section]
        return sectionInfo.numberOfObjects
    }
}
