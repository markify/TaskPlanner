//
//  todoViewController.swift
//  ToDoApp
//
//  Created by XCode on 3/15/18.
//  Copyright © 2018 MarkS. All rights reserved.
//
import UIKit

class todoViewController: UITableViewController{
    
    var checkmarks = [Int : Bool]()
    var item = todoModel()
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let todoCount = item.todolist{
            return todoCount.count
        }else {
            return 0
        }
    }
    //Swipe Right Edit
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath)
        ->UISwipeActionsConfiguration? {
        let complete = completeEdit(at: indexPath)
        return UISwipeActionsConfiguration(actions: [complete])
    }
    
    func completeEdit(at indexPath:IndexPath)-> UIContextualAction {
        
        let action = UIContextualAction(style: .normal, title: "Edit") { (action,view,completion) in
            let alert = UIAlertController(title: "", message: "rename todolist item", preferredStyle: .alert)
            alert.addTextField(configurationHandler: { (textField) in
                textField.text = self.item.todolist?[indexPath.row]
            })
            alert.addAction(UIAlertAction(title: "Update", style: .default, handler: { (updateAction) in
                self.item.todolist?[indexPath.row] = alert.textFields!.first!.text!
                self.item.saveData()
                self.tableView.reloadRows(at: [indexPath], with: .automatic)
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: false)
            completion(true)
        }
        action.backgroundColor = .orange
        return action
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewRows")
        
        cell?.textLabel?.text = item.todolist?[indexPath.row]
        cell?.backgroundColor = .clear
        cell?.tintColor = .black
        if checkmarks[indexPath.row] != nil{
            cell?.accessoryType = checkmarks[indexPath.row]! ? .checkmark :.none
        } else {
            checkmarks[indexPath.row] = false
            cell?.accessoryType = .none
        }
        
        UserDefaults.standard.set(NSKeyedArchiver.archivedData(withRootObject: checkmarks), forKey: "checkmarks")
        UserDefaults.standard.synchronize()
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath as IndexPath) {
            if cell.accessoryType == . checkmark {
                checkmarks[indexPath.row] = false
            } else {
                cell.accessoryType = .checkmark
                checkmarks[indexPath.row] = true
            }
        }
        UserDefaults.standard.set(NSKeyedArchiver.archivedData(withRootObject: checkmarks), forKey: "checkmarks")
        UserDefaults.standard.synchronize()
        tableView.reloadData()
    }
    
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]{
        
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete", handler: { (action, indexPath) in
           
            self.checkmarks[indexPath.row] = false
            self.item.todolist?.remove(at: indexPath.row)
            self.item.saveData()
            tableView.reloadData()
        })
        
        return [deleteAction]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let backgroundImage = UIImage(named:"background.jpg")
        let imageView = UIImageView(image: backgroundImage)
        imageView.alpha = 0.4
        self.tableView.backgroundView = imageView
    }
    
    override func viewDidAppear(_ animated: Bool) {
        item.loadData()
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        if let checks = UserDefaults.standard.value(forKey: "checkmarks") as? NSData {
            checkmarks = NSKeyedUnarchiver.unarchiveObject(with: checks as Data) as! [Int : Bool]
        }
        
    }

}

