//
//  TaskDataSource.swift
//  ProximityReminders
//
//  Created by Christopher Bonuel on 12/21/16.
//  Copyright © 2016 Christopher Bonuel. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class TaskDataSource: NSObject, UITableViewDataSource {
    
    // MARK: - Properties
    
    private let tableView: UITableView
    private let fetchedResultsController: TaskFetchedResultsController
    
    init(tableView: UITableView, fetchRequest: NSFetchRequest, managedObjectContext: NSManagedObjectContext) {
        
        self.tableView = tableView
        
        self.fetchedResultsController = TaskFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: managedObjectContext, tableView: tableView)
        
        super.init()
    }
}