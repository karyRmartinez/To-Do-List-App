//
//  ToDoListPersistence.swift
//  createToDoList
//
//  Created by Kary Martinez on 4/26/20.
//  Copyright © 2020 Kary Martinez. All rights reserved.
//

import Foundation


struct ToDoPersistenceHelper {
    static let manager = ToDoPersistenceHelper()
    
    func save(newToDo: toDo) throws {
        try persistenceHelper.save(newElement: newToDo)
    }
    
    func getPersistedToDos() throws -> [toDo] {
        return try persistenceHelper.getObjects()
    }
    
    func deleteToDo(title: String) throws {
        do {
            let toDos = try getPersistedToDos()
            let newToDos = toDos.filter { $0.title != title}
            try persistenceHelper.replace(elements: newToDos)
        }
    }
    
    func isDuplicate(selectedTitle: String) throws -> Bool{
        let everyToDo = try persistenceHelper.getObjects()
        if everyToDo.contains(where: { (toDo) -> Bool in
            toDo.title.lowercased() == selectedTitle.lowercased()
        }){
            return true
        }
        return false
    }
    
    private let persistenceHelper = PersistenceHelper<toDo>(fileName: "todos.plist")
    
    private init() {}
}
