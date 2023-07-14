//
//  Country_Data+CoreDataProperties.swift
//  TableView With Core Data
//
//  Created by Nikhil Saini on 18/04/23.
//
//

import Foundation
import CoreData


extension Country_Data {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Country_Data> {
        return NSFetchRequest<Country_Data>(entityName: "Country_Data")
    }

    @NSManaged public var country_name: String?

}

extension Country_Data : Identifiable {

}
