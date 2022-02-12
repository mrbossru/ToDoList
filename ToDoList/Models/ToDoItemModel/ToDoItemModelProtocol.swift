//
//  ToDoItemModelProtocol.swift
//  ToDoList
//
//  Created by Max on 10.02.2022.
//

import Foundation
import SwiftyJSON

protocol ToDoItemModelProtocol {
    func Write(task: JSON)
    func Read(id: Int) -> JSON?
    func Read(dateStart: Double, dateFinish: Double) -> JSON?
    func Delete(id: Int)
}
