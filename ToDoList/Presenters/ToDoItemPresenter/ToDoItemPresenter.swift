//
//  ToDoItemPresenter.swift
//  ToDoList
//
//  Created by Max on 29.01.2022.
//

import Foundation
import SwiftyJSON

class ToDoItemPresenter: ToDoItemPresenterProtocol {

    // MARK: - Properties

    unowned var view: ToDoItemViewControllerProtocol?
    lazy var model: ToDoItemModelProtocol  = ToDoItemModel(toDoItemPresemter: self)

    // MARK: - Init

    init(view: ToDoItemViewControllerProtocol) {
        self.view = view
    }

    // MARK: - ToDoItemPresenterProtocol

    func getTask(id: Int) -> (Int, Double, Double, String, String)? {
        if let taskJson = model.read(id: id) {
            return (taskJson["id"].intValue, taskJson["date_start"].doubleValue,
                    taskJson["date_finish"].doubleValue,
                    taskJson["name"].stringValue,
                    taskJson["description"].stringValue)
        }
        return nil
    }

    func deleteTask(id: Int) {
        model.delete(id: id)
    }

    func saveTask(id: Int?, dateStart: Double, dateFinish: Double, name: String, taskDescription: String) -> Bool {
        if dateStart >= dateFinish {
            view?.showErrorMsg(msg: "Начало задачи не может быть позже ее окончания")
            return false
        }
        if name == "" {
            view?.showErrorMsg(msg: "Введите имя задачи")
            return false
        }
        if taskDescription == "" {
            view?.showErrorMsg(msg: "Введите описание задачи")
            return false
        }
        if model.read(dateStart: getDate(date: dateStart,
                                         isStart: true),
                     dateFinish: getDate(date: dateFinish,
                                         isStart: false)) != nil {
            view?.showErrorMsg(msg: "Данное время занято")
            return false
        }

        var dict = [String: AnyObject]()
        if id == nil {
            dict["id"] = Int(Date().timeIntervalSince1970)as AnyObject
        } else {
            dict["id"] = id as AnyObject
        }
        dict["date_start"] = dateStart as AnyObject
        dict["date_finish"] = dateFinish as AnyObject
        dict["name"] = name as AnyObject
        dict["description"] = taskDescription as AnyObject
        model.write(task: JSON(dict))
        return true
    }

    func showErrorMsg(msg: String) {
        view?.showErrorMsg(msg: msg)
    }

    func getDate(date: Double, isStart: Bool) -> Double {
        let newDate = NSDate(timeIntervalSince1970: date)
        let calendar = Calendar.current
        var components = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: newDate as Date)
        if isStart {
            components.minute = 0
        } else {
            if components.minute! > 0 {
                components.minute = 0
                components.hour! += 1
            }
        }
        return calendar.date(from: components)!.timeIntervalSince1970
    }
}
