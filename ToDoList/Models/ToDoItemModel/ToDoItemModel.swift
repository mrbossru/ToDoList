//
//  ToDoItemModel.swift
//  ToDoList
//
//  Created by Max on 10.02.2022.
//

import Foundation
import SwiftyJSON

class ToDoItemModel: ToDoItemModelProtocol {

    // MARK: - Properties

    private lazy var model = DataModel.getModel()
    unowned var presenter: ToDoItemPresenterProtocol?

    // MARK: - Init

    init(toDoItemPresemter: ToDoItemPresenterProtocol) {
        presenter = toDoItemPresemter
    }

    // MARK: - ToDoItemModelProtocol

    func write(task: JSON) {
        model.write(task: task)
    }

    func read(id: Int) -> JSON? {
        return model.read(id: id)
    }

    func delete(id: Int) {
        model.delete(id: id)
    }

    func read(dateStart: Double, dateFinish: Double) -> JSON? {
        if let json = model.read(dateStart: dateStart, dateFinish: dateFinish) {
            return json.first
        }
        return nil
    }
}
