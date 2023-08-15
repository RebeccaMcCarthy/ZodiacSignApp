//
//  CDPerson+CoreDataProperties.swift
//  ZodiacSigns
//
//  Created by Rebecca McCarthy on 28/03/2022.
//
//

import Foundation
import CoreData


extension CDPerson {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDPerson> {
        return NSFetchRequest<CDPerson>(entityName: "CDPerson")
    }

    @NSManaged public var name: String?
    @NSManaged public var phone: String?
    @NSManaged public var address: String?
    @NSManaged public var email: String?
    @NSManaged public var image: String?

}

extension CDPerson : Identifiable {

}
