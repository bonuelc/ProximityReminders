//
//  TaskFetchedResultsController.swift
//  ProximityReminders
//
//  Created by Christopher Bonuel on 12/21/16.
//  Copyright © 2016 Christopher Bonuel. All rights reserved.
//

import UIKit
import CoreData

class TaskFetchedResultsController: NSFetchedResultsController {
    
    // MARK: - Properties 
    
    var tableView: UITableView?
    
    init(fetchRequest: NSFetchRequest, managedObjectContext: NSManagedObjectContext, tableView: UITableView? = nil) {
        
        self.tableView = tableView
        
        super.init(fetchRequest: fetchRequest, managedObjectContext: managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
    }
}
