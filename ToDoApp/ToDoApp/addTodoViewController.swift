//
//  addTodoViewController.swift
//  ToDoApp
//
//  Created by XCode on 3/15/18.
//  Copyright © 2018 MarkS. All rights reserved.
//
import UIKit
class addTodoViewController: UIViewController{
    
    var todos = todoModel()
   
    @IBOutlet weak var todoText: UITextField!
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        if (todoText.text != nil) && todoText.text != "" {
            if let checkValid = todoText.text{
                todoText.text = ""
                todoText.placeholder = "Add todos here ."
                todos.todolist!.append(checkValid)
                todos.saveData()
            }
            else {
                print("nil value or system error")
            }
        }
    }

}

