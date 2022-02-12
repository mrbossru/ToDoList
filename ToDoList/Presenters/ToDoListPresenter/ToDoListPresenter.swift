//
//  ToDoListPresenter.swift
//  ToDoList
//
//  Created by Max on 29.01.2022.
//

import Foundation
import SwiftyJSON

class ToDoListPresenter: ToDoListPresenterProtocol {

    // MARK: - Properties

    unowned var view: ToDoListViewControllerProtocol?
    lazy var model: ToDoListModelProtocol  = ToDoListModel(toDoListPresemter: self)

    // MARK: - Init

    init(view: ToDoListViewControllerProtocol?) {
        self.view = view
    }

    // MARK: - ToDoListPresenterProtocol

    func getTask(dateStart: Double, dateFinish: Double) -> (Int, Double, Double, String, String)? {
        if let taskJson = model.read(dateStart: dateStart, dateFinish: dateFinish) {
            return (taskJson["id"].intValue, taskJson["date_start"].doubleValue,
                    taskJson["date_finish"].doubleValue,
                    taskJson["name"].stringValue,
                    taskJson["description"].stringValue)
        }
        return nil
    }

    func requestData() {
        model.requestData()
    }

    func reloadData() {
        view?.reloadData()
    }

    func getDate(date: Date, hour: Int) -> Double {
        let calendar = Calendar.current
        var components = Calendar.current.dateComponents([.year, .month, .day, .hour], from: date)
        components.hour = hour
        return calendar.date(from: components)!.timeIntervalSince1970
    }
}
