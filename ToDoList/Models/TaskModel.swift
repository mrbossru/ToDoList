//
//  TaskModel.swift
//  ToDoList
//
//  Created by Max on 07.02.2022.
//

import Foundation
import RealmSwift
import SwiftyJSON

class TaskModel: Object {
    @objc dynamic var id : Int = 0
    @objc dynamic var date_start : Double = 0
    @objc dynamic var date_finish : Double = 0
    @objc dynamic var name = ""
    @objc dynamic var taskDescription = ""

    override static func primaryKey() -> String? {
        return "id"
    }
    
    convenience init (taskJson: JSON) {
        self.init()
        self.id = taskJson["id"].intValue
        self.date_start = taskJson["date_start"].doubleValue
        self.date_finish = taskJson["date_finish"].doubleValue
        self.name = taskJson["name"].stringValue
        self.taskDescription = taskJson["description"].stringValue
    }

    public func toJSON() -> JSON {
        var dict = [String: AnyObject]()
        dict["id"] = self.id as AnyObject
        dict["date_start"] = self.date_start as AnyObject
        dict["date_finish"] = self.date_finish as AnyObject
        dict["name"] = self.name as AnyObject
        dict["taskDescription"] = self.taskDescription as AnyObject
        return JSON(dict)
    }
}
