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

protocol LocationMonitoringDelegate {
    func startMonitoring(region: CircularNotificationRegion?)
    func stopMonitoring(region: CircularNotificationRegion?)
}

class TaskListController: UITableViewController {
    
    // MARK: Properties
    
    private let managedObjectContext: NSManagedObjectContext
    
    lazy var locationManager: LocationManager = {
        return LocationManager(presentingViewController: self)
    }()
    
    lazy var dataSource: TaskDataSource = {
        
        let dataSource = TaskDataSource(tableView: self.tableView, fetchRequest: Task.allTasks, managedObjectContext: self.managedObjectContext)
        
        dataSource.delegate = self
        
        return dataSource
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
        
        let taskVC = TaskViewController(task: newTask, locationManager: locationManager, managedObjectContext: managedObjectContext)
        
        taskVC.delegate = self
        
        let navigationController = UINavigationController(rootViewController: taskVC)
        
        showDetailViewController(navigationController, sender: sender)
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let task = dataSource.taskAtIndexPath(indexPath)
        let taskVC = TaskViewController(task: task, locationManager: locationManager, managedObjectContext: managedObjectContext)
        
        taskVC.delegate = self
        
        let navigationController = UINavigationController(rootViewController: taskVC)
        
        showDetailViewController(navigationController, sender: nil)
    }
}

// MARK: - LocationMonitoringDelegate

extension TaskListController: LocationMonitoringDelegate {
    
    func startMonitoring(region: CircularNotificationRegion?) {
        
        guard let region = region?.toCLRegion else { return }
        
        locationManager.startMonitoringForRegion(region)
    }
    
    func stopMonitoring(region: CircularNotificationRegion?) {
        
        guard let region = region?.toCLRegion else { return }
        
        locationManager.stopMonitoringForRegion(region)
    }
}

// MARK: - Helper Methods

extension TaskListController {
    
    func setUpBarButtonItems() {
        
        navigationItem.leftBarButtonItem = editButtonItem()
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(showTaskViewController(_:)))
        navigationItem.rightBarButtonItem = addButton
    }
}
