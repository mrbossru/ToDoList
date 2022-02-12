import Foundation
import RealmSwift
import UIKit
import SwiftUI
import SwiftyJSON

class DataModel {

    // MARK: - Properties

    let realm = try! Realm()
    static var model: DataModel?
    public var reloadData: (() -> Void)?
    // MARK: - Metods

    init() {
    }

    public static func getModel() -> DataModel {
        if let model = model {
            return model
        } else {
            self.model = DataModel()
            return self.model!
        }
    }

    public func  write(task: JSON) {
        let newTask = TaskModel(taskJson: task)
        do {
            try realm.write { () -> Void in
                realm.add(newTask, update: Realm.UpdatePolicy.modified)
            }
        } catch {}
        reloadData?()
    }

    public func read(id: Int) -> JSON? {
        let elements = realm.objects(TaskModel.self).filter("id = %@", id)
        if let element = elements.first {
            return element.toJSON()
        }
        return nil
    }

    public func read(dateStart: Double, dateFinish: Double) -> [JSON]? {
            let elements = realm.objects(TaskModel.self).filter("dateStart < %@",
                                                                dateFinish).filter("dateFinish > %@",
                                                                                    dateStart)
            return elements.compactMap { $0.toJSON() }
    }

    public func delete(id: Int) {
        do {
            try realm.write({
                realm.delete(realm.objects(TaskModel.self).filter("id = %@", id))
            })
        } catch {}
        reloadData?()
    }
}
