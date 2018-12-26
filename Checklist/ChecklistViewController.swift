//
//  ViewController.swift
//  Checklist
//
//  Created by Mac on 24/12/2018.
//  Copyright © 2018 HardSoft inc. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {
  
  var todoList: TodoList
  
  required init?(coder aDecoder: NSCoder) {
    
    todoList = TodoList()
    super.init(coder: aDecoder)
    
  }
  
  @IBAction func addButton(_ sender: UIBarButtonItem) {
    let newRowIndex = todoList.todos.count
    _ = todoList.newTodo()
    let indexPath = IndexPath(row: newRowIndex, section: 0)
    tableView.insertRows(at: [indexPath], with: .automatic)
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationController?.navigationBar.prefersLargeTitles = true
    
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return todoList.todos.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
    let item = todoList.todos[indexPath.row]
    configureText(for: cell, with: item)
    configureCheckmark(for: cell, with: item)
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if let cell = tableView.cellForRow(at: indexPath) {
      let item = todoList.todos[indexPath.row]
      item.toggleChecked()
      configureCheckmark(for: cell, with: item)
      tableView.deselectRow(at: indexPath, animated: true)
    }
  }
  
  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    todoList.todos.remove(at: indexPath.row)
    let indexPaths = [indexPath]
    tableView.deleteRows(at: indexPaths, with: .automatic)
  }
  
//  override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
//      return UITableViewCell.EditingStyle.insert
//  }
  
  func configureCheckmark(for cell: UITableViewCell, with item: ChecklistItem) {
    
    if item.checked {
      cell.accessoryType = .checkmark
    } else {
      cell.accessoryType = .none
    }
    print ("\(item.text) - \(item.checked)")
  }
  
  func configureText (for cell: UITableViewCell, with item: ChecklistItem) {
    if let label = cell.viewWithTag(1000) as? UILabel {
      label.text = item.text
    }
  }
  
}

