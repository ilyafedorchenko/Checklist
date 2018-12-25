//
//  TodoList.swift
//  Checklist
//
//  Created by Mac on 26/12/2018.
//  Copyright © 2018 HardSoft inc. All rights reserved.
//

import Foundation

class TodoList {
  var todos: [ChecklistItem] = []
  private let texts = ["Take a jog", "Watch a movie", "Code an app", "Walk the dog", "Study design patterns"]
  
  init(_ count: Int) {
    for i in 0..<count {
      todos.append(ChecklistItem())
      todos[i].text = texts[i % 5]
    }
    
  }
  
}
