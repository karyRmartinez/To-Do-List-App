//
//  ViewController.swift
//  createToDoList
//
//  Created by Kary Martinez on 4/24/20.
//  Copyright © 2020 Kary Martinez. All rights reserved.
//

import UIKit

//enum CellIdentifier: String {
//    case SubtitleCell
//}

class ToDoListViewController: UIViewController {
    
    var todos = [toDosl]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
         
        }
    }
    var completedTodo = [CompletedtoDosl]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
 
    
    
    lazy var tableView: UITableView = {
       // let tableView = UITableView(frame: UIScreen.main.bounds)
          let tableView = UITableView()
        tableView.register(ToDoTableViewCell.self, forCellReuseIdentifier: "todocell")
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
       self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView

    }()
    
    lazy var createButton: UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(navigateScreen))
        return button
        
        }()
        

    @objc private func navigateScreen() {
           self.navigationController?.pushViewController(CreateViewController(), animated: true)
       }
    
    override func viewWillAppear(_ animated: Bool) {
        do {
            todos = try ToDoPersistenceHelper.manager.getPersistedToDos()
        } catch {
            print("didn't get items")
        }
        
        
     
    }
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
     //  view.backgroundColor = .red
       tableView.delegate = self
      tableView.dataSource = self
        setTableViewConstraints()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "text.badge.plus"), style: .plain, target: self, action: #selector(createButtonPressed))

        
    }
    @objc func createButtonPressed(){
         self.navigationController?.pushViewController(CreateViewController(), animated: true)
        //TODO: transition to a controller where you can create ToDos
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

extension ToDoListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
        switch section {
        case 0: return todos.count
        case 1: return completedTodo.count

             default: return 0
             }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // let toDo = todos[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "todocell") as? ToDoTableViewCell else {return UITableViewCell()}
        switch indexPath.section {
             case 0:
                cell.titleLabel.text = todos[indexPath.row].title
             case 1:
           //     cell.titleLabel.text = completedTodo[indexPath.row].title
              cell.titleLabel.text = ""
             default:
                 cell.titleLabel.text = ""
             }

     
      return cell

    }
    
    
    func tableView(_ tableView: UITableView, heightForRow indexPath: IndexPath) -> CGFloat {
         return 100
     }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
        
       }
       
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
         switch section {
         case 0: return "To Do List"
         case 1: return "Completed"

         default: return "nothing"
         }
     }
     
     
    
}
