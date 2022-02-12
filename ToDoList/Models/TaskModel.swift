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
    @objc dynamic var id: Int = 0
    @objc dynamic var dateStart: Double = 0
    @objc dynamic var dateFinish: Double = 0
    @objc dynamic var name = ""
    @objc dynamic var taskDescription = ""

    override static func primaryKey() -> String? {
        return "id"
    }

    convenience init (taskJson: JSON) {
        self.init()
        self.id = taskJson["id"].intValue
        self.dateStart = taskJson["date_start"].doubleValue
        self.dateFinish = taskJson["date_finish"].doubleValue
        self.name = taskJson["name"].stringValue
        self.taskDescription = taskJson["description"].stringValue
    }

    public func toJSON() -> JSON {
        var dict = [String: AnyObject]()
        dict["id"] = self.id as AnyObject
        dict["date_start"] = self.dateStart as AnyObject
        dict["date_finish"] = self.dateFinish as AnyObject
        dict["name"] = self.name as AnyObject
        dict["description"] = self.taskDescription as AnyObject
        return JSON(dict)
    }
}
