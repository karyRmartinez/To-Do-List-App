//
//  ViewController.swift
//  createToDoList
//
//  Created by Kary Martinez on 4/24/20.
//  Copyright © 2020 Kary Martinez. All rights reserved.
//

import UIKit

enum CellIdentifier: String {
    case SubtitleCell
}

class ToDoListViewController: UIViewController {
    
    var todos = [toDosl]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
         
        }
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: UIScreen.main.bounds)
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
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
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
    
    override func viewWillAppear(_ animated: Bool) {
        loadData()
    }
    
    func loadData(){
        do {
          todos = try ToDoPersistenceHelper.manager.getPersistedToDos()
        } catch {
            print(error)
        }
    }
    


}

extension ToDoListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let toDo = todos[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.SubtitleCell.rawValue) as? ToDoTableViewCell else {return UITableViewCell()}
      cell.textLabel?.text = toDo.title
     
      return cell

    }
    
    
    func tableView(_ tableView: UITableView, heightForRow indexPath: IndexPath) -> CGFloat {
         return 100
     }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
         switch section {
         case 0: return "To Do List"
         case 1: return "Completed"
        
         default: return "nothing"
         }
     }
     
     
    
}
