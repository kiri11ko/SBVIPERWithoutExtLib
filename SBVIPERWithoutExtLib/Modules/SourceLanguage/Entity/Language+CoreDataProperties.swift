//
//  Language+CoreDataProperties.swift
//  SBVIPERWithoutExtLib
//
//  Created by Кирилл Лукьянов on 08.12.2019.
//  Copyright © 2019 Кирилл Лукьянов. All rights reserved.
//
//

import Foundation
import CoreData

extension Language {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Language> {
        return NSFetchRequest<Language>(entityName: "Language")
    }

    @NSManaged public var languageFrom: String?
    @NSManaged public var languageto: String?

}
