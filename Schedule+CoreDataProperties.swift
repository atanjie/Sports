//
//  Schedule+CoreDataProperties.swift
//  Sports
//
//  Created by ios13 on 17/11/13.
//  Copyright © 2017年 ios20. All rights reserved.
//

import Foundation
import CoreData


extension Schedule {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Schedule> {
        return NSFetchRequest<Schedule>(entityName: "Schedule");
    }

    @NSManaged public var eid: Int32
    @NSManaged public var gameDate: String?
    @NSManaged public var gameTime: String?
    @NSManaged public var id: Int32
    @NSManaged public var info: String?

}
