//
//  AddReminderViewController.swift
//  ProximityReminders
//
//  Created by Christopher Bonuel on 3/30/17.
//  Copyright © 2017 Christopher Bonuel. All rights reserved.
//

import UIKit

class AddReminderViewController: UIViewController {
    
    // MARK: - UI
    
    lazy var addButton: UIButton = {
        
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitleColor(button.tintColor, forState: .Normal)
        
        button.setTitle("Add a new reminder", forState: .Normal)
        
        button.addTarget(self, action: #selector(presentNewTaskViewController), forControlEvents: .TouchUpInside)
        
        return button
    }()
    
    // MARK: - Properties
    
    var delegate: TaskListController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem()
        navigationItem.leftItemsSupplementBackButton = true
        
        view.backgroundColor = .whiteColor()
    }
    
    // MARK: - Layout
    
    override func viewWillLayoutSubviews() {
        
        view.addSubview(addButton)
        
        NSLayoutConstraint.activateConstraints([
            addButton.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor),
            addButton.centerYAnchor.constraintEqualToAnchor(view.centerYAnchor),
        ])
    }
    
    @objc func presentNewTaskViewController() {
        delegate?.showTaskViewController(self)
    }
}
