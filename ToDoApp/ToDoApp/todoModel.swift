//
//  todoModel.swift
//  ToDoApp
//
//  Created by XCode on 3/15/18.
//  Copyright © 2018 MarkS. All rights reserved.
//
import UIKit

class todoModel{
    
    var todolist:[String]?
    
    init(){
        if let valid = UserDefaults.standard.array(forKey: "todolist") as? [String]{
            todolist = valid
        } else {
            todolist = ["-     Adding Todos Started    -"]
        }
    }
    
    func saveData(){
        UserDefaults.standard.set(todolist, forKey: "todolist")
    }
    
    func fetchData() -> [String]? {
        if let todos = UserDefaults.standard.array(forKey: "todolist") as? [String] {
            return todos
        }
        else {
            return nil
        }
    }
    
    func loadData(){
        todolist = UserDefaults.standard.array(forKey: "todolist") as? [String]
    }
}
