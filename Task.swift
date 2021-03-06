//
//  Task.swift
//  ProximityReminders
//
//  Created by Christopher Bonuel on 12/20/16.
//  Copyright © 2016 Christopher Bonuel. All rights reserved.
//

import Foundation
import CoreData
import CoreLocation

class Task: NSManagedObject {
    
    // TODO: change to 'class' stored property instead of 'static' when supported
    private static let entityName = "\(Task.self)"
    
    override var description: String {
        return text
    }
    
    var notificationRegionEvent: NotificationRegionEvent {
        
        if let circularNotificationRegion = circularNotificationRegion {
            return circularNotificationRegion.notifyOnEntry ? .Enter : .Exit
        }
        
        return .None
    }
    
    override func awakeFromInsert() {
        text = ""
        dateCreated = NSDate()
    }
    
    class func task(inManagedObjectContext moc: NSManagedObjectContext) -> Task {
        return NSEntityDescription.insertNewObjectForEntityForName(Task.entityName, inManagedObjectContext: moc) as! Task
    }
    
    func setRegion(coordinate: CLLocationCoordinate2D, radius: Double = 50.0, notifyOnEntry: Bool, notifyOnExit: Bool, inManagedObjectContext moc: NSManagedObjectContext) {
        
        let circularNotificationRegion = CircularNotificationRegion.circularNotificationRegion(coordinate, notifyOnEntry: notifyOnEntry, notifyOnExit: notifyOnExit, inManagedObjectContext: managedObjectContext!)
        
        circularNotificationRegion.task = self
        
        self.circularNotificationRegion = circularNotificationRegion
    }
    
    func deleteCircularNotificationRegion(inManagedObjectContext moc: NSManagedObjectContext) {
        guard let region = circularNotificationRegion else { return }
        moc.deleteObject(region)
    }
    
    // TODO: change to 'class' stored property instead of 'static' when supported
    static let allTasks: NSFetchRequest = {
        let request = NSFetchRequest(entityName: Task.entityName)
        request.sortDescriptors = [NSSortDescriptor(key: "dateCreated", ascending: false)]
        return request
    }()
}
