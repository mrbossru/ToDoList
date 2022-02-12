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

    private lazy var model = DataModel.GetModel()
    unowned var presenter: ToDoListPresenterProtocol?

    // MARK: - Init

    init(toDoListPresemter: ToDoListPresenterProtocol) {
        presenter = toDoListPresemter
        model.reloadData =  {
            self.presenter?.reloadData()
        }
    }

    // MARK: - ToDoListModelProtocol

    func requestData() {
        presenter?.reloadData()
    }

    func Read(dateStart: Double, dateFinish: Double) -> JSON? {
        if let json = model.Read(dateStart: dateStart, dateFinish: dateFinish) {
            return json.first
        }
        return nil
    }
}
