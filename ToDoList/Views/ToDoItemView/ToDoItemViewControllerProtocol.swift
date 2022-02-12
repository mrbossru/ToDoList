//
//  ToDoItemViewControllerProtocol.swift
//  ToDoList
//
//  Created by Max on 29.01.2022.
//

import Foundation

protocol ToDoItemViewControllerProtocol: AnyObject {
    func setId(id: Int?)
    func showErrorMsg(msg: String)
}
