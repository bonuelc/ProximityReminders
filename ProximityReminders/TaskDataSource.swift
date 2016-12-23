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
    
    // MARK: - UITableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return fetchedResultsController.sections?.count ?? 0
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let section = fetchedResultsController.sections?[section] else { return 0 }
        
        return section.numberOfObjects
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        guard let task = fetchedResultsController.objectAtIndexPath(indexPath) as? Task else { fatalError() }
        
        let cell = UITableViewCell()
        
        cell.textLabel!.text = task.description
        
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete {
            deleteTaskAtIndexPath(indexPath)
        }
    }
}

// MARK: - Helper Methods

extension TaskDataSource {
    
    func taskAtIndexPath(indexPath: NSIndexPath) -> Task {
        return fetchedResultsController.objectAtIndexPath(indexPath) as! Task
    }
    
    func deleteTaskAtIndexPath(indexPath: NSIndexPath) -> Task {
        
        let task = taskAtIndexPath(indexPath)
        
        fetchedResultsController.managedObjectContext.deleteObject(task)
        
        return task
    }
}