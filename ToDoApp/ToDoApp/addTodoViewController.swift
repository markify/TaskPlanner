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
                let alert = UIAlertController(title: "A todo has been added", message: "", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Continue", style: .cancel, handler: nil))
                self.present(alert, animated: true)
            }
            else {
                print("nil value or system error")
            }
        }
        let alert = UIAlertController(title: "Todo not added", message: "add todo on the textfield above", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Continue", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }

}

