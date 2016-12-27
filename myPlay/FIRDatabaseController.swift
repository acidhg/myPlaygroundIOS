//
//  ViewController.swift
//  myPlay
//
//  Created by JOHYUNGEUN on 2016. 12. 26..
//  Copyright © 2016년 Keukey. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class FIRDatabaseViewController: UIViewController, UITableViewDataSource {
    private struct MyCat {
        let name: String
    }
    
    @IBOutlet weak var tableView: UITableView!
    private let ref = FIRDatabase.database().reference()
    private var cats: [MyCat] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "FIRDBCell")
        FIRAuth.auth()?.signInAnonymously(completion: { (user, error) in
            if let error = error {
                print("Firebase auth error \(error) for user \(user)")
                return
            }

            self.ref.child("고양이").observeSingleEvent(of: .value, with: { (snapshot) in
//                print(snapshot.key)
//                print(snapshot.value ?? "no snapshot")
//                for child in snapshot.children.allObjects {
//                    print(child)
//                    if let snap = child as? FIRDataSnapshot {
//                        print(snap.value ?? "no snapshot")
//                        if let value = snap.value {
//                            if let name = value as? String {
//                                self.cats.append(MyCat(name: name))
//                            }
//                        }
//                    }
//                }
                for child in snapshot.children.allObjects {
                    if let catsnap = child as? FIRDataSnapshot, let name = catsnap.value as? String {
                        self.cats.append(MyCat(name: name))
                    }
                }
                self.tableView.reloadData()
            }, withCancel: { (error) in
                print("Cannot fetch \(error)")
            })
        })
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
        let cat = MyCat(name: name)
        cats.append(cat)
        ref.child("고양이/\(String(cats.count))").setValue(name)    // setValue로 새 아이템 추가 시 key는 path 쪽에 들어감
    }
    
    // MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FIRDBCell")
        let cat = cats[indexPath.row]
        cell!.textLabel!.text = cat.name
        return cell!
    }
}

