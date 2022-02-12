//
//  ToDoListModel.swift
//  ToDoList
//
//  Created by Max on 10.02.2022.
//

import Foundation
import SwiftyJSON

class ToDoListModel: ToDoListModelProtocol {

    // MARK: - Properties

    private lazy var model = DataModel.getModel()
    unowned var presenter: ToDoListPresenterProtocol?

    // MARK: - Init

    init(toDoListPresemter: ToDoListPresenterProtocol) {
        presenter = toDoListPresemter
        model.reloadData = {
            self.presenter?.reloadData()
        }
    }

    // MARK: - ToDoListModelProtocol

    func requestData() {
        presenter?.reloadData()
    }

    func read(dateStart: Double, dateFinish: Double) -> JSON? {
        if let json = model.read(dateStart: dateStart, dateFinish: dateFinish) {
            return json.first
        }
        return nil
    }
}
