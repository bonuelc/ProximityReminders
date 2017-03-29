//
//  TaskViewController.swift
//  ProximityReminders
//
//  Created by Christopher Bonuel on 12/21/16.
//  Copyright © 2016 Christopher Bonuel. All rights reserved.
//

import UIKit
import CoreLocation

class TaskViewController: UITableViewController {
    
    // MARK: - UI
    
    lazy var textField: UITextField = {
        
        let textField = UITextField()
        
        textField.placeholder = "Enter task here"
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    lazy var segmentedControl: UISegmentedControl = {
        
        let segmentedControl = UISegmentedControl(items: ["None", "When I Enter", "When I Exit"])
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        return segmentedControl
    }()
    
    // MARK: - Properties
    
    let locationManager: LocationManager
    
    var task: Task? {
        didSet {
            configureView()
        }
    }
    
    init(task: Task? = nil, locationManager: LocationManager) {
        
        self.task = task
        
        self.locationManager = locationManager
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        configureView()
        
        navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem()
        navigationItem.leftItemsSupplementBackButton = true
        
        tableView.scrollEnabled = false
        tableView.tableFooterView = UIView(frame: CGRectZero)
    }
    
    // MARK: - UITableViewDataSource
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
        case 0:
            return "Task"
        case 1:
            return "Notify (for current location)"
        default:
            fatalError("Section not handled")
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0, 1:
            return 1
        default:
            fatalError("Section not handled")
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        cell.selectionStyle = .None
        
        var view: UIView!
        
        switch indexPath.section {
        case 0:
            view = textField
        case 1:
            view = segmentedControl
        default:
            fatalError("Section not handled")
        }
        
        cell.addSubview(view)
        
        NSLayoutConstraint.activateConstraints([
            view.leftAnchor.constraintEqualToAnchor(cell.contentView.leftAnchor),
            view.topAnchor.constraintEqualToAnchor(cell.contentView.topAnchor),
            view.rightAnchor.constraintEqualToAnchor(cell.contentView.rightAnchor),
            view.bottomAnchor.constraintEqualToAnchor(cell.contentView.bottomAnchor),
        ])
        
        return cell
    }
}

// MARK: - Helper Methods

extension TaskViewController {
    
    func configureView() {
        
        if let task = task {
            textField.text = task.text
            // TODO: set segmentedControl.selectedSegmentIndex
        } else {
            // reset all
            textField.text = ""
            segmentedControl.selectedSegmentIndex = 0
        }
    }
}