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
  
  
  init() {
    for i in 0..<texts.count {
      todos.append(ChecklistItem())
      todos[i].text = texts[i]
    }
  }
  
  private func getRandomText() -> String {
    let newTexts = ["New todo item", "Generic todo", "Fill me out", "I need something to do", "Much todo about nothing"]
    let randomNum = Int.random(in: 0 ..< newTexts.count)
    return newTexts[randomNum]
  }
  
  func newTodo() -> ChecklistItem {
    let item = ChecklistItem()
    item.text = getRandomText()
    item.checked = true
    todos.append(item)
    return item
  }
  
}
