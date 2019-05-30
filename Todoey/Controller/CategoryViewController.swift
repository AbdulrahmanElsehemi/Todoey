 //
//  CategoryViewController.swift
//  Todoey
//
//  Created by Abdelrahman on 5/29/19.
//  Copyright © 2019 Abdelrahman. All rights reserved.
//

import UIKit
import CoreData
 
class CategoryViewController: UITableViewController {
    
    
    var  categories = [Category]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCategory()
    }
    
    //MARK:- TableView DaraSource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        cell.textLabel?.text = categories[indexPath.row].name
        
        return cell
    }
    
    //MARK:- TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier:"goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationVC = segue.destination as! TodoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            
            destinationVC.selectedCategory = categories[indexPath.row]
        }
        
        
        
    }
    
    
    //MARK:- Data Manipulation Methods
    func saveCategories ()
    {
        
        do {
            try context.save()
        } catch {
            print("Error saaving category \(error)")
        }
        tableView.reloadData()
        
    }
    
    func loadCategory(with requset: NSFetchRequest<Category> = Category.fetchRequest()) {
        
        do {
            categories = try  context.fetch(requset)
            
        } catch {
            print("Error loading categories \(error)")
        }
        tableView.reloadData()
    }
    
    
    
    //MARK:- Add New Categories

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what will happen once the user clicks the add button on ou UIAlert
            
            let newCategory = Category(context: self.context)
            newCategory.name = textField.text!
            
            self.categories.append(newCategory)
        
            self.saveCategories ()
       
            
        }
        
      
        alert.addAction(action)
        
        alert.addTextField { (field) in
            textField = field
            textField.placeholder = "Create new Category"
        }
        present(alert,animated: true,completion: nil)
    }
    

}
