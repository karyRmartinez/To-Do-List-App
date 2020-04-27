//
//  CreateViewController.swift
//  createToDoList
//
//  Created by Kary Martinez on 4/24/20.
//  Copyright © 2020 Kary Martinez. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController {
    
    lazy var ListOfToDosTextField: UITextField = {
        let ToDoField = UITextField()
        ToDoField.translatesAutoresizingMaskIntoConstraints = false
        ToDoField.borderStyle = .bezel
            ToDoField.backgroundColor = .white
        return ToDoField
    }()
    
    lazy var AddButton: UIButton = {
        let button = UIButton()
        button.setImage(.add, for: .normal)
        button.addTarget(self, action: #selector(addButtonPressed), for: .touchDown)
        return button
    }()
    
    @objc private func addButtonPressed() {
        
//        let newtodo = toDosl(title: self.ListOfToDosTextField.text ??)
//        do {
//            try ToDoPersistenceHelper.manager.save(newToDo: toDosl)
//            self.navigationController?.popViewController(animated: true)
//        } catch {
//            fatalError()
//        }
           let item = toDosl(title: self.ListOfToDosTextField.text ?? "something gross")
            do {
                try ToDoPersistenceHelper.manager.save(newToDo: item)
                self.navigationController?.popViewController(animated: true)
            } catch {
                fatalError()
            }
        }
        
    
    private func setTextFieldConstraints() {
        NSLayoutConstraint.activate([
            ListOfToDosTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ListOfToDosTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -200),
            ListOfToDosTextField.widthAnchor.constraint(equalToConstant: 300),
            ListOfToDosTextField.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    private func AddButtonConstraints() {
        AddButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            AddButton.heightAnchor.constraint(equalToConstant: 80),
            AddButton.widthAnchor.constraint(equalToConstant: 80),
            AddButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            AddButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
    
    private func addSubviews() {
        self.view.addSubview(ListOfToDosTextField)
        self.view.addSubview(AddButton)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        addSubviews()
        setTextFieldConstraints()
        AddButtonConstraints()

        // Do any additional setup after loading the view.
    }
    



}

extension CreateViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
