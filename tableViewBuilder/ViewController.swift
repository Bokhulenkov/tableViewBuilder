//
//  ViewController.swift
//  tableViewBuilder
//
//  Created by Alexander Bokhulenkov on 05.11.2024.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    let tableView = UITableView()
    var tableViewBuilder: TableViewBuilder?
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(tableView)
        setConstraints()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "test")
        
        tableViewBuilder = TableViewBuilder(tableView: tableView)
        let cell = TableViewCellModel(identifier: "test")
        cell.onFill = { cell in
            var config = cell.defaultContentConfiguration()
            config.text = "this is cell with id test"
            cell.contentConfiguration = config
        }
        
    }

    // MARK: - Settings Constraint
    
    private func setConstraints() {
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
    }
}
