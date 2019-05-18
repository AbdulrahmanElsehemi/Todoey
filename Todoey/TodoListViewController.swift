//
//  ViewController.swift
//  Todoey
//
//  Created by Abdelrahman on 5/18/19.
//  Copyright © 2019 Abdelrahman. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    let itemArray = ["abdelrahman", "ahmed","shorouk"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK - Tableveiw Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
    //MARK - Table Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // print(itemArray[indexPath.row])
                
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {

            tableView.cellForRow(at: indexPath)?.accessoryType = .none

        } else {
            
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark

        }
       
        tableView.deselectRow(at: indexPath, animated: true)
        
    }

}

