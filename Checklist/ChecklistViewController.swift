//
//  ViewController.swift
//  Checklist
//
//  Created by Mac on 24/12/2018.
//  Copyright © 2018 HardSoft inc. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1000
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
    
    let content = ["Take a jog", "Watch a movie", "Code an app", "Walk the dog", "Study design patterns"]
    
    if let label = cell.viewWithTag(1000) as? UILabel {
      label.text = content[indexPath.row % 5]
      }
    return cell
  }

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if let cell = tableView.cellForRow(at: indexPath) {
      if cell.accessoryType == .none {
        cell.accessoryType = .checkmark
      } else {
        cell.accessoryType = .none
      }
      tableView.deselectRow(at: indexPath, animated: true)
    }
  }
}

