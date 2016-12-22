//
//  Task.swift
//  ProximityReminders
//
//  Created by Christopher Bonuel on 12/20/16.
//  Copyright © 2016 Christopher Bonuel. All rights reserved.
//

import Foundation
import CoreData

class Task: NSManagedObject {
    
    // TODO: change to 'class' stored property instead of 'static' when supported
    private static let entityName = "\(Task.self)"
    
    override var description: String {
        return text
    }
    
    override func awakeFromInsert() {
        dateCreated = NSDate()
    }
    
    class func task(inManagedObjectContext moc: NSManagedObjectContext) -> Task {
        return NSEntityDescription.insertNewObjectForEntityForName(Task.entityName, inManagedObjectContext: moc) as! Task
    }
    
    // TODO: change to 'class' stored property instead of 'static' when supported
    static let allTasks: NSFetchRequest = {
        let request = NSFetchRequest(entityName: Task.entityName)
        request.sortDescriptors = [NSSortDescriptor(key: "dateCreated", ascending: false)]
        return request
    }()
}
