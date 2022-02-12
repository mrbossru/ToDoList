//
//  ToDoListCell.swift
//  ToDoList
//
//  Created by Max on 08.02.2022.
//

import Foundation
import UIKit

final class ToDoListCell: UITableViewCell {

    // MARK: - Properties

    var id: Int?
    var taskBtnAction: ((_ task: Int?) -> Void)?
    var dateStart: Double = 0
    var dateFinish: Double = 0

    // MARK: - IBOutlet

    @IBOutlet weak var taskBtn: UIButton!
    @IBOutlet weak var time: UILabel!

    // MARK: - IBAction

    @IBAction func taskBtnClick(_ sender: Any) {
        taskBtnAction?(id)
    }
}
