//
//  ViewController.swift
//  myPlay
//
//  Created by JOHYUNGEUN on 2016. 12. 26..
//  Copyright © 2016년 Keukey. All rights reserved.
//

import UIKit
import SugarRecord

class SugarRecordViewController: UIViewController, UITableViewDataSource {
    
    struct Person {
        var name: String
    }
    
    var db:CoreDataDefaultStorage?
    @IBOutlet weak var tableView: UITableView!
    var people: [Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "SugarCell")
        db = coreDataStorage()
        //        let fetch: [Person] = try! db?.fetch(FetchRequest<Person>)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addName(_ sender: Any) {
        // data save
    }
    
    func coreDataStorage() -> CoreDataDefaultStorage {
        let store = CoreDataStore.named("db")
        let bundle = Bundle(for: self.classForCoder)
        let model = CoreDataObjectModel.merged([bundle])
        let defaultStorage = try! CoreDataDefaultStorage(store: store, model: model)
        return defaultStorage
    }
    
    
    // MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SugarCell")
        let person = people[indexPath.row]
        cell!.textLabel!.text = person.name
        return cell!
    }
}

