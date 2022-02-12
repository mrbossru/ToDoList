//
//  ToDoListPresenterProtocol.swift
//  ToDoList
//
//  Created by Max on 29.01.2022.
//

import Foundation
import SwiftyJSON

protocol ToDoListPresenterProtocol: AnyObject {
    func requestData()
    func getTask(dateStart: Double, dateFinish: Double) -> (Int, Double, Double, String, String)?
    func getDate(date: Date, hour: Int) -> Double
    func reloadData()
}
