
import Foundation
import RealmSwift
import UIKit
import SwiftUI
import SwiftyJSON

class DataModel {

    // MARK: - Properties

    let realm = try! Realm(fileURL: URL(fileURLWithPath: "/Users/max/Desktop/TestRealm.realm"))
    static var model: DataModel?
    public var reloadData: (() -> Void)?
    // MARK: - Metods

    init() {
    }

    public static func GetModel() -> DataModel {
        if let _model = model {
            return _model
        }
        else {
            model = DataModel()
            return model!
        }
    }

    public func  Write(task: JSON){
        let newTask = TaskModel(taskJson: task)
        try! realm.write { () -> Void in
            realm.add(newTask, update: Realm.UpdatePolicy.modified)
        }
        reloadData?()
    }
    
    public func Read(id: Int) -> JSON? {
        let elements = realm.objects(TaskModel.self).filter("id = %@", id)
        if let element = elements.first {
            return element.toJSON()
        }
        return nil
    }

    public func Read(dateStart: Double, dateFinish: Double) -> [JSON]? {
        let elements = realm.objects(TaskModel.self).filter("date_start < %@", dateFinish).filter("date_finish > %@", dateStart)
        return elements.compactMap{$0.toJSON()}
    }

    public func Delete(id: Int) {
        try! realm.write({
            realm.delete(realm.objects(TaskModel.self).filter("id = %@", id))
        })
        reloadData?()
    }
}
