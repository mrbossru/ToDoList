//
//  ToDoItemPresenterProtocol.swift
//  ToDoList
//
//  Created by Max on 29.01.2022.
//

import Foundation

protocol ToDoItemPresenterProtocol: AnyObject {
    func deleteTask(id: Int) throws
    func saveTask(id: Int?, dateStart: Double, dateFinish: Double, name: String, taskDescription: String) -> Bool
    func getTask(id: Int) -> (Int, Double, Double, String, String)?
    func showErrorMsg(msg: String)
}
