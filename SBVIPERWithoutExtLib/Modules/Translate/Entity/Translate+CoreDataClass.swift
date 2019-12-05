//
//  Translate+CoreDataClass.swift
//  VIPERSBCoreData
//
//  Created by Кирилл Лукьянов on 01.12.2019.
//  Copyright © 2019 Кирилл Лукьянов. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Translate)
public class Translate: NSManagedObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Translate> {
        return NSFetchRequest<Translate>(entityName: "Translate")
    }

}
