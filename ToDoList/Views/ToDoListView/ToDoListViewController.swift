//
//  ToDoListViewController.swift
//  ToDoList
//
//  Created by Max on 29.01.2022.
//

import Foundation
import UIKit

class ToDoListViewController: UIViewController, UITableViewDataSource, ToDoListViewControllerProtocol {

    // MARK: - Properties

    lazy private var presenter: ToDoListPresenterProtocol = ToDoListPresenter(view: self)

    // MARK: - IBOutlet

    @IBOutlet weak var toDoTable: UITableView!
    @IBOutlet weak var toDoDate: UIDatePicker!

    // MARK: - IBAction

    @IBAction func toDoDateChanged(_ sender: Any) {
        reloadData()
    }

    @IBAction func addTaskButton(_ sender: Any) {
        showView(taskId: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        toDoTable.dataSource = self
        toDoTable.estimatedRowHeight = 44.0
        toDoTable.rowHeight = UITableView.automaticDimension
     //   presenter.requestData()
    }

    // MARK: - UIViewController

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "ToDoListCell",
            for: indexPath) as? ToDoListCell
        else {
            return UITableViewCell()
        }
        cell.time.text = (indexPath.row<10 ? "0" : "") + String(indexPath.row) + ":00-" + ((indexPath.row + 1)<10 ? "0" : "") + String(indexPath.row + 1) + ":00"
        cell.dateStart = presenter.getDate(date: toDoDate.date, hour: indexPath.row)
        cell.dateFinish = presenter.getDate(date: toDoDate.date, hour: indexPath.row + 1)
        let task = presenter.getTask(dateStart: cell.dateStart, dateFinish: cell.dateFinish)
        if let task = task {
            cell.id = task.0
            cell.taskBtn.setTitle(task.3, for: .normal)
            cell.taskBtnAction = showView
            cell.taskBtn.isHidden = false
        } else {
            cell.taskBtn.setTitle("", for: .normal)
            cell.taskBtn.isHidden = true
        }
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 24
    }

    // MARK: - ToDoListViewControllerProtocol

    func reloadData() {
        DispatchQueue.main.async {
            self.toDoTable.reloadData()
        }
    }

    func showView(taskId: Int?) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ToDoItemViewController")
        if let viewController = nextViewController as? ToDoItemViewControllerProtocol{
            viewController.setId(id: taskId)
        }
        self.show(nextViewController, sender: self)
    }
}
