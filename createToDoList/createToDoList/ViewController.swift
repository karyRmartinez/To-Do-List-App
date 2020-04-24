//
//  ViewController.swift
//  createToDoList
//
//  Created by Kary Martinez on 4/24/20.
//  Copyright © 2020 Kary Martinez. All rights reserved.
//

import UIKit

class ToDoListViewController: UIViewController {
    
    var todos = [toDo]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: UIScreen.main.bounds)
        tableView.backgroundColor = .lightGray
        return tableView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setTableViewConstraints()
         self.view.addSubview(tableView)
    }
    
    
    private func setTableViewConstraints() {
         NSLayoutConstraint.activate([
             tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
             tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
             tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
             tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
         ])
     }
    


}

//extension ToDoListViewController: UITableViewDataSource, UITableViewDelegate {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return todos.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//    
//    
//}
