//
//  TaskListController.swift
//  ProximityReminders
//
//  Created by Christopher Bonuel on 12/21/16.
//  Copyright © 2016 Christopher Bonuel. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class TaskListController: UITableViewController {
    
    // MARK: Properties
    
    private let managedObjectContext: NSManagedObjectContext
    
    lazy var dataSource: TaskDataSource = {
        return TaskDataSource(tableView: self.tableView, fetchRequest: Task.allTasks, managedObjectContext: self.managedObjectContext)
    }()
    
    init(managedObjectContext: NSManagedObjectContext) {
        
        self.managedObjectContext = managedObjectContext
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}