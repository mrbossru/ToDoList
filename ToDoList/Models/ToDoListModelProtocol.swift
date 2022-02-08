//
//  ToDoListModelProtocol.swift
//  ToDoList
//
//  Created by Max on 29.01.2022.
//

import Foundation
import SwiftyJSON

protocol ToDoListModelProtocol: AnyObject {
    func  Write(task: JSON)
    func Read(id: Int) -> JSON?
    func Read(dateStart: Double, dateFinish: Double) -> [JSON]
    func Delete(id: Int)
}
