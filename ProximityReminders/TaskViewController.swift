//
//  TaskViewController.swift
//  ProximityReminders
//
//  Created by Christopher Bonuel on 12/21/16.
//  Copyright © 2016 Christopher Bonuel. All rights reserved.
//

import UIKit

class TaskViewController: UITableViewController {
    
    // MARK: - UI
    
    lazy var textField: UITextField = {
        
        let textField = UITextField()
        
        textField.placeholder = "Enter task here"
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
}
