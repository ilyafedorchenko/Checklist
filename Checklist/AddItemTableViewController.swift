//
//  AddItemTableViewController.swift
//  Checklist
//
//  Created by Илья Федорченко on 27/12/2018.
//  Copyright © 2018 HardSoft inc. All rights reserved.
//

import UIKit

class AddItemTableViewController: UITableViewController {
  

  @IBOutlet weak var textField: UITextField!
  
  @IBOutlet weak var cancelBarButton: UIBarButtonItem!
  
  
  @IBAction func cancel(_ sender: Any) {
    navigationController?.popViewController(animated: true)
  }
  
  @IBOutlet weak var addBarButton: UIBarButtonItem!
  
  
  @IBAction func done(_ sender: Any) {
    navigationController?.popViewController(animated: true)
//    print("\(textField.text)")
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.largeTitleDisplayMode = .never
//    textField.delegate = self
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    textField.becomeFirstResponder()
  }
  
  override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
    return nil
  }
  
  
}


extension AddItemTableViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return false
  }
  
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    guard let oldText = textField.text,
      let stringRange = Range(range, in: oldText) else {
        return false
    }
    
    let newText = oldText.replacingCharacters(in: stringRange, with: string)
    if newText.isEmpty {
      addBarButton.isEnabled = false
    } else {
      addBarButton.isEnabled = true
    }
    return true
  }
  
}
