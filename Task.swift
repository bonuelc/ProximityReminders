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
    
    override func awakeFromInsert() {
        dateCreated = NSDate()
    }
}
