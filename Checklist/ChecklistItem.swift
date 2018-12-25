//
//  ChecklistItem.swift
//  Checklist
//
//  Created by Mac on 25/12/2018.
//  Copyright © 2018 HardSoft inc. All rights reserved.
//

import Foundation

class ChecklistItem {
  
  var text = ""
  var checked = false
  
  func toggleChecked() {
    checked.toggle()
  }
  
}
