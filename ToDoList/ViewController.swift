//
//  ViewController.swift
//  ToDoList
//
//  Created by Max on 29.01.2022.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        let data = try! Realm().objects(TaskModel.self).filter("date_start < %@", Date().timeIntervalSince1970)[0].toJSON()
        print(data)


        // Do any additional setup after loading the view.
    }
}

