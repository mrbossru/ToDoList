//
//  ToDoItemModelProtocol.swift
//  ToDoList
//
//  Created by Max on 10.02.2022.
//

import Foundation
import SwiftyJSON

protocol ToDoItemModelProtocol {
    func write(task: JSON)
    func read(id: Int) -> JSON?
    func read(dateStart: Double, dateFinish: Double) -> JSON?
    func delete(id: Int)
}
