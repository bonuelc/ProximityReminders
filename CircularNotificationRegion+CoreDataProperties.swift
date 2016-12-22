//
//  CircularNotificationRegion+CoreDataProperties.swift
//  ProximityReminders
//
//  Created by Christopher Bonuel on 12/20/16.
//  Copyright © 2016 Christopher Bonuel. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension CircularNotificationRegion {
    @NSManaged var dateCreated: NSDate
    @NSManaged var latitude: Double
    @NSManaged var longitude: Double
    @NSManaged var notifyOnEntry: Bool
    @NSManaged var notifyOnExit: Bool
    @NSManaged var radius: Double
    @NSManaged var task: Task
}
