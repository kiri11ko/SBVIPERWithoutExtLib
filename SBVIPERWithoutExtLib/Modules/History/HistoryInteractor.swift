//
//  HistoryInteractor.swift
//  VIPERSBCoreData
//
//  Created Кирилл Лукьянов on 17.11.2019.
//  Copyright © 2019 Кирилл Лукьянов. All rights reserved.


import CoreData

class HistoryInteractor: HistoryInteractorProtocol {
    var coredata: DataManager!
    func numberOfSection() -> Int {
        return fetchedResultsController.sections?.count ?? 0
    }
    func numberOfRowsInSection(section: Int) -> Int {
        guard let sections = fetchedResultsController.sections else {
            fatalError("No sections in fetchedResultsController")
        }
        let sectionInfo = sections[section]
        return sectionInfo.numberOfObjects
    }
    func getObjects(index: IndexPath) -> AnyObject {
        guard let object = self.fetchedResultsController?.object(at: index) else {
            fatalError("Attempt to configure cell without a managed object")
        }
        return object
    }
    weak var presenter: HistoryPresenterProtocol?
    var fetchedResultsController: NSFetchedResultsController<Translate>!
    func initializeFetchedResultsController() {
        let request: NSFetchRequest<Translate> = Translate.fetchRequest()
        let text = NSSortDescriptor(key: #keyPath(Translate.text), ascending: true)
        request.sortDescriptors = [text]
        fetchedResultsController = NSFetchedResultsController(fetchRequest: request,
                                                              managedObjectContext: coredata.mainContext,
                                                              sectionNameKeyPath: nil,
                                                              cacheName: nil)
        do {
            try fetchedResultsController.performFetch()
        } catch {
            fatalError("Failed to initialize FetchedResultsController: \(error)")
        }
    }
}
