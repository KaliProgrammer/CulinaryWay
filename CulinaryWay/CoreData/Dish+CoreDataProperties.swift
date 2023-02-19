//
//  Dish+CoreDataProperties.swift
//  
//
//  Created by MacBook Air on 20.01.2023.
//
//

import Foundation
import CoreData


extension Dish {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Dish> {
        return NSFetchRequest<Dish>(entityName: "Dish")
    }

    @NSManaged public var recipe: String?
    @NSManaged public var image: String?

}
