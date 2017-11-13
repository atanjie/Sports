//
//  Events+CoreDataProperties.swift
//  Sports
//
//  Created by ios13 on 17/11/13.
//  Copyright © 2017年 ios20. All rights reserved.
//

import Foundation
import CoreData


extension Events {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Events> {
        return NSFetchRequest<Events>(entityName: "Events");
    }

    @NSManaged public var basicInfo: String?
    @NSManaged public var icon: String?
    @NSManaged public var id: Int32
    @NSManaged public var keyInfo: String?
    @NSManaged public var name: String?
    @NSManaged public var olympicInfo: String?

}
