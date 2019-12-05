//
//  CoreDataService.swift
//  VIPERSBCoreData
//
//  Created by Кирилл Лукьянов on 01.12.2019.
//  Copyright © 2019 Кирилл Лукьянов. All rights reserved.
//

import Foundation
import CoreData

class CoreDataService {

    private lazy var persistentContainer: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "TranslateModel")
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error as NSError? {

                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    func saveContext (model: TranslateEntity) {
        let context = persistentContainer.viewContext
        _ = Translate(model: model, context: context)
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    func loadData() {
        let context = persistentContainer.viewContext
        do {
            _ = try context.fetch(Translate.fetchRequest()) as? [Translate]
        } catch (let error) {
            print(error)
        }
//        let translate = results.first!
    }

}
