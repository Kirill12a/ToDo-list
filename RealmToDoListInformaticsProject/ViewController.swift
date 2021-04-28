//
//  ViewController.swift
//  RealmToDoListInformaticsProject
//
//  Created by Kirill Drozdov on 28.04.2021.
//

import UIKit

import RealmSwift

class ViewController: UITableViewController {
    
    
    var items: Results<Item>!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let realm = try! Realm()
        self.items = realm.objects(Item.self)
 
// print(Realm.Configuration.defaultConfiguration.fileURL)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
        }
        
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item = self.items[indexPath.row]
        let naem = "\(item.name), id \(item.id), surname \(item.surname)"
        cell.textLabel?.text = naem
         
        return cell
        }
        
    @IBAction func addAction(_ sender: Any) {
        
        //Alert
        let alr = UIAlertController(title: "Push", message: "New", preferredStyle: .actionSheet)
        alr.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action) in
            print("Ты нажал Yse")
        }))
        alr.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
        present(alr, animated: true)
        //\Alert
        
    
    
        
        let item = Item()
        item.surname = "\(self.items.count + 1)"
        item.id = self.items.count + 1
        item.name = "Item\(self.items.count + 1)"
        
        let realm = try! Realm()
        try! realm.write{
            realm.add(item)
        }

        self.tableView.reloadData()
    }
    @IBAction func additAction(_ sender: Any) {
        let edit = !self.tableView.isEditing
        self.tableView.setEditing(edit, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            let realm = try! Realm()
            let item = self.items[indexPath.row]
        
            try! realm.write{
                realm.delete(item)
            }
    
            self.tableView.reloadData()
        }
    }
}



