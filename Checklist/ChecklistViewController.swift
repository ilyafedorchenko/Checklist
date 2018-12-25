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
  let count = 50
  
  required init?(coder aDecoder: NSCoder) {
    
    todoList = TodoList(count)
    
    super.init(coder: aDecoder)
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  
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
  
  func configureCheckmark(for cell: UITableViewCell, with item: ChecklistItem) {
    
      if item.checked {
        cell.accessoryType = .none
      } else {
        cell.accessoryType = .checkmark
      }
   }
  
  func configureText (for cell: UITableViewCell, with item: ChecklistItem) {
    if let label = cell.viewWithTag(1000) as? UILabel {
      label.text = item.text
    }
  }
  
}

