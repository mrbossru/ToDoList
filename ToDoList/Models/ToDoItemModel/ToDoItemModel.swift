//
//  ToDoItemModel.swift
//  ToDoList
//
//  Created by Max on 10.02.2022.
//

import Foundation
import SwiftyJSON

class ToDoItemModel : ToDoItemModelProtocol {

    // MARK: - Properties

    private lazy var model = DataModel.GetModel()
    unowned var presenter: ToDoItemPresenterProtocol?

    // MARK: - Init

    init(toDoItemPresemter: ToDoItemPresenterProtocol) {
        presenter = toDoItemPresemter
    }

    // MARK: - ToDoItemModelProtocol

    func Write(task: JSON) {
        model.Write(task: task)
    }

    func Read(id: Int) -> JSON? {
        return model.Read(id: id)
    }

    func Delete(id: Int) {
        model.Delete(id: id)
    }

    func Read(dateStart: Double, dateFinish: Double) -> JSON? {
        if let json = model.Read(dateStart: dateStart, dateFinish: dateFinish) {
            return json.first
        }
        return nil
    }
}
