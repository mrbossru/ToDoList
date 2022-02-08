//
//  ToDoListModel.swift
//  ToDoList
//
//  Created by Max on 29.01.2022.
//

import Foundation
import RealmSwift
import UIKit
import SwiftUI
import SwiftyJSON

class ToDoListModel: ToDoListModelProtocol {

    // MARK: - Properties

    let realm = try! Realm()

    // MARK: - ToDoListModelProtocol

    public func  Write(task: JSON){
        let newTask = TaskModel(taskJson: task)
        try! realm.write { () -> Void in
            realm.add(newTask, update: Realm.UpdatePolicy.modified)
        }
    }
    
    public func Read(id: Int) -> JSON? {
        let elements = realm.objects(TaskModel.self).filter("id = %@", id)
        if let element = elements.first {
            return element.toJSON()
        }
        return nil
    }

    public func Read(dateStart: Double, dateFinish: Double) -> [JSON] {
        let elements = realm.objects(TaskModel.self).filter("date_start >= %@", dateStart).filter("date_finish < %@", dateFinish)
        return elements.compactMap{$0.toJSON()}
    }

    public func Delete(id: Int) {
        try! realm.write({
            realm.delete(realm.objects(TaskModel.self).filter("id = %@", id))
        })
    }
}
