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

    @NSManaged public var code: Int16
    @NSManaged public var lang: String?
    @NSManaged public var text: String?

//    required convenience public init(from decoder: Decoder) throws {
//        guard let context = decoder.userInfo[CodingUserInfoKey.context!] as? NSManagedObjectContext else { fatalError() }
//        guard let entity = NSEntityDescription.entity(forEntityName: "Translate", in: context) else { fatalError() }
//
//        self.init(entity: entity, insertInto: context)
//
//        let container = try decoder.container(keyedBy: CodingKeys.self)
////        _ = container.decodeIfPresent(String.self, forKey: )
//    }

    convenience init(model: TranslateEntity, context: NSManagedObjectContext) {
//        self.code = Int16(model.code)
        self.init(context: context)
        self.lang = model.lang
        self.text = model.text?.first
    }
}
