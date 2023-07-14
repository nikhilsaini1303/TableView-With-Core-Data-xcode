//
//  DataBaseHandler.swift
//  TableView With Core Data
//
//  Created by Nikhil Saini on 18/04/23.
//

import Foundation
import CoreData
import UIKit

class DataBaseHandler {
    
    func saveData(cName: String) {
        
        let appDe = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDe.persistentContainer.viewContext
        let countryObject = NSEntityDescription.insertNewObject(forEntityName: "Country_Data", into: context) as! Country_Data
        
        countryObject.country_name = cName
        
        do {
            try context.save()
            print("Data Has Been Saved!")
        }
        catch {
            print("Error Occured During Saving Data")
        }
        
    }
    
    func fetchData() -> [Country_Data] {
        
        var cData = [Country_Data]()
        let appDe = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDe.persistentContainer.viewContext
        
        do {
            cData = try context.fetch(Country_Data.fetchRequest()) as! [Country_Data]
        }
        catch {
            print("Error Occured During Fetch Request!")
        }
        
        
        return cData
    }
    
    
}
