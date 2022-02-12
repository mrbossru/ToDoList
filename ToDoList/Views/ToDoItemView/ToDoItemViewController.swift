//
//  ToDoItemViewController.swift
//  ToDoList
//
//  Created by Max on 29.01.2022.
//

import Foundation
import UIKit

class ToDoItemViewController: UIViewController, ToDoItemViewControllerProtocol {

    // MARK: - Properties

    lazy private var presenter: ToDoItemPresenterProtocol = ToDoItemPresenter(view: self)
    var id: Int?

    // MARK: - IBOutlet

    @IBOutlet weak var startDate: UIDatePicker!
    @IBOutlet weak var finishedDate: UIDatePicker!
    @IBOutlet weak var nameTask: UITextField!
    @IBOutlet weak var descriptionTask: UITextView!

    // MARK: - IBAction

    @IBAction func saveTaskButton(_ sender: Any) {
        if presenter.saveTask(id: id,
                              dateStart: startDate.date.timeIntervalSince1970,
                              dateFinish: finishedDate.date.timeIntervalSince1970,
                              name: nameTask.text ?? "",
                              taskDescription: descriptionTask.text) {
            self.dismiss(animated: true, completion: nil)
        }
    }
    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func deleteTaskButton(_ sender: Any) {
        if let id = id {
            do {
                try presenter.deleteTask(id: id)
            } catch {}
        }
        self.dismiss(animated: true, completion: nil)
    }

    // MARK: - ToDoItemViewControllerProtocol

    func setId(id: Int?) {
        self.id = id
    }

    func showErrorMsg(msg: String) {
        let alert = UIAlertController(title: "Error", message: msg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if let taskId = id {
            if let task = presenter.getTask(id: taskId) {
                startDate.setDate(NSDate(timeIntervalSince1970: task.1) as Date, animated: false)
                finishedDate.setDate(NSDate(timeIntervalSince1970: task.2) as Date, animated: false)
                nameTask.text = task.3
                descriptionTask.text = task.4
            }
        }
    }
}
