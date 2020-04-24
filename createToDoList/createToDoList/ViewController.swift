//
//  ViewController.swift
//  createToDoList
//
//  Created by Kary Martinez on 4/24/20.
//  Copyright © 2020 Kary Martinez. All rights reserved.
//

import UIKit

class ToDoListViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: UIScreen.main.bounds)
        tableView.backgroundColor = .lightGray
        return tableView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

