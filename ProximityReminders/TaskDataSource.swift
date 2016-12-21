//
//  TaskDataSource.swift
//  ProximityReminders
//
//  Created by Christopher Bonuel on 12/21/16.
//  Copyright © 2016 Christopher Bonuel. All rights reserved.
//

import Foundation
import UIKit

class TaskDataSource: NSObject, UITableViewDataSource {
    
    // MARK: - Properties
    
    private let tableView: UITableView
    
    init(tableView: UITableView) {
        
        self.tableView = tableView
        
        super.init()
    }
}