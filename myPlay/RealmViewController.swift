//
//  ViewController.swift
//  myPlay
//
//  Created by JOHYUNGEUN on 2016. 12. 26..
//  Copyright © 2016년 Keukey. All rights reserved.
//

import UIKit
import RealmSwift

class Cat: Object {
    dynamic var name = ""
}

class RealmViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var cats: [Cat] = []
    var realm: Realm!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "RealmCell")
        realm = try! Realm()
        cats = Array(realm.objects(Cat.self))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addName(_ sender: Any) {
        let alert = UIAlertController(title: "New Name", message: "Add a new name", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Save", style: .default) { (action: UIAlertAction) in
            let textField = alert.textFields!.first
            self.save(name: textField!.text!)
            self.tableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { (action: UIAlertAction) in
        }
        alert.addTextField { (textField: UITextField) in
        }
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    func save(name: String) {
        let cat = Cat()
        cat.name = name
        cats.append(cat)
        try! realm.write {
            realm.add(cat)
        }
    }
    
    // MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RealmCell")
        let cat = cats[indexPath.row]
        cell!.textLabel!.text = cat.name
        return cell!
    }
}
