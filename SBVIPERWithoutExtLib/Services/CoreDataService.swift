//
//  CoreDataService.swift
//  VIPERSBCoreData
//
//  Created by Кирилл Лукьянов on 01.12.2019.
//  Copyright © 2019 Кирилл Лукьянов. All rights reserved.
//

import Foundation
import CoreData

class CoreDataService: DataManager {
    lazy var mainContext: NSManagedObjectContext = {
        var managedObjectContext: NSManagedObjectContext
        managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        let modelURL = Bundle.main.url(forResource: "TranslateModel", withExtension: "momd")
        let managedObjectModel = NSManagedObjectModel(contentsOf: modelURL!)
        let persistentCoordinator = NSPersistentStoreCoordinator(managedObjectModel:
                                                managedObjectModel!)
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,
                                                .userDomainMask, true)[0]
        let storeURL = URL(fileURLWithPath: documentsPath.appending("/TranslateModel.sqlite"))
        do {
            try persistentCoordinator.addPersistentStore(ofType: NSSQLiteStoreType,
                                                 configurationName: nil,
                                                 at: storeURL,
                                                 options: [NSSQLitePragmasOption:
                                                              ["journal_mode": "MEMORY"]])
        } catch {
            abort()
        }
        managedObjectContext.persistentStoreCoordinator = persistentCoordinator
        return managedObjectContext
    }()
    lazy var backgroundContext: NSManagedObjectContext = {
        return NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
    }()

    func saveContext (model: TranslateEntity) {
        _ = Translate(model: model, context: mainContext)
        if mainContext.hasChanges {
            do {
                try mainContext.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
//
//    func loadData() -> [Translate] {
//        var result: [Translate] = []
//        do {
//            result = try mainContext.fetch(Translate.fetchRequest()) as? [Translate] ?? []
//        } catch let error {
//            print(error)
//        }
//        return result
//    }
    //    private lazy var persistentContainer: NSPersistentContainer = {
    //
    //        let container = NSPersistentContainer(name: "TranslateModel")
    //        container.loadPersistentStores(completionHandler: { (_, error) in
    //            if let error = error as NSError? {
    //
    //                fatalError("Unresolved error \(error), \(error.userInfo)")
    //            }
    //        })
    //        return container
    //    }()

    //    private lazy var persistentCoordinator: NSPersistentStoreCoordinator = {
    //
    //        let modelURL = Bundle.main.url(forResource: "Test", withExtension: "momd")
    //        let managedObjectModel = NSManagedObjectModel(contentsOf: modelURL!)
    //        let persistentCoordinator = NSPersistentStoreCoordinator(managedObjectModel:
    //                                                managedObjectModel!)
    //        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,
    //                                                .userDomainMask, true)[0]
    //        let storeURL = URL(fileURLWithPath: documentsPath.appending("/Test.sqlite"))
    //        print("storeUrl = \(String(describing: storeURL))")
    //        do {
    //            try persistentCoordinator.addPersistentStore(ofType: NSSQLiteStoreType,
    //                                                 configurationName: nil,
    //                                                 at: storeURL,
    //                                                 options: [NSSQLitePragmasOption:
    //                                                              ["journal_mode":"MEMORY"]])
    //            return persistentCoordinator
    //        } catch {
    //            abort()
    //        }
    //    } ()
}
