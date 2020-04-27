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
    
    
    private func setTextFieldConstraints() {
        NSLayoutConstraint.activate([
            ListOfToDosTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ListOfToDosTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -200),
            ListOfToDosTextField.widthAnchor.constraint(equalToConstant: 300),
            ListOfToDosTextField.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    private func addSubviews() {
        self.view.addSubview(ListOfToDosTextField)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setTextFieldConstraints()

        // Do any additional setup after loading the view.
    }
    



}
