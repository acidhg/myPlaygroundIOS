//
//  Dog+CoreDataProperties.swift
//  myPlay
//
//  Created by JOHYUNGEUN on 2016. 12. 27..
//  Copyright © 2016년 Keukey. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Dog {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Dog> {
        return NSFetchRequest<Dog>(entityName: "Dog");
    }

    @NSManaged public var name: String?
}
