//
//  CoreDataCenter.swift
//  myPlay
//
//  Created by JOHYUNGEUN on 2016. 12. 27..
//  Copyright © 2016년 Keukey. All rights reserved.
//

import Foundation
import CoreData

class CoreDataCenter {
    static let shared = CoreDataCenter()
    
    lazy var container: NSPersistentContainer = {
        let persistentContainer = NSPersistentContainer(name: "myPlay")
        persistentContainer.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return persistentContainer
    }()
    
    func saveContext() {
        let context = container.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetch<T: NSManagedObject>(type: T.Type) -> [T]? {
        let context = container.viewContext
        let entityName = String(describing: type)
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        do {
            let results = try context.fetch(fetchRequest)
//            for result in results {
//                print("results type: \(type(of: result))")
//            }
            return (results as! [T])
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
            return nil
        }
    }
    
    func new<T: NSManagedObject>(type: T.Type) -> T? {
        let context = container.viewContext
        let entityName = String(describing: type)
        
        guard let entity = NSEntityDescription.entity(forEntityName: entityName, in: context) else {
            print("Could not get entity \(entityName)")
            return nil
        }
        
        return T(entity: entity, insertInto: context)
    }
}
