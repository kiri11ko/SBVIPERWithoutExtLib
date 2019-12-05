//
//  Translate+CoreDataProperties.swift
//  VIPERSBCoreData
//
//  Created by Кирилл Лукьянов on 01.12.2019.
//  Copyright © 2019 Кирилл Лукьянов. All rights reserved.
//
//

import Foundation
import CoreData

extension Translate {
    @NSManaged public var code: Int16
    @NSManaged public var lang: String?
    @NSManaged public var text: String?
    @NSManaged public var source: String?
    convenience init(model: TranslateEntity, context: NSManagedObjectContext) {
        self.init(context: context)
        self.lang = model.lang
        self.text = model.text?.first
        self.source = model.source
    }

}
