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
    
    lazy var locationManager: LocationManager = {
        return LocationManager()
    }()
    
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
    
    override func viewDidLoad() {
        tableView.dataSource = dataSource
        
        setUpBarButtonItems()
    }
}

// MARK: - Navigation

extension TaskListController {
    
    func showTaskViewController(sender: AnyObject?) {
        
        guard sender is UIBarButtonItem else { return }
            
        let newTask = Task.task(inManagedObjectContext: managedObjectContext)
        
        let taskVC = TaskViewController(task: newTask, locationManager: locationManager)
        
        let navigationController = UINavigationController(rootViewController: taskVC)
        
        showDetailViewController(navigationController, sender: sender)
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let task = dataSource.taskAtIndexPath(indexPath)
        let taskVC = TaskViewController(task: task, locationManager: locationManager)
        
        let navigationController = UINavigationController(rootViewController: taskVC)
        
        showDetailViewController(navigationController, sender: nil)
    }
}

// MARK: - Helper Methods

extension TaskListController {
    
    func setUpBarButtonItems() {
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(showTaskViewController(_:)))
        navigationItem.rightBarButtonItem = addButton
    }
}
