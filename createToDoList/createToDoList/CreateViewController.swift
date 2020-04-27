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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
