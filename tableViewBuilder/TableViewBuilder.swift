//
//  TableViewBuilder.swift
//  tableViewBuilder
//
//  Created by Alexander Bokhulenkov on 05.11.2024.
//

import UIKit

final class TableViewBuilder: NSObject {
    
    var tableView = UITableView()
    var cells: [TableViewCellModel] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    // MARK: - Init
    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        setDelegate()
    }
    
    // MARK: - Methods
    
    private func setDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

// MARK: - Extensions

extension TableViewBuilder: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Select row index \(indexPath.row)")
    }
}

extension TableViewBuilder: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cells[indexPath.row].identifier, for: indexPath)
        cells[indexPath.row].onFill?(cell)
//        cell.backgroundColor = .systemPink
//        var listConfiguration = cell.defaultContentConfiguration()
//        listConfiguration.text = "simle number \(simpleNumberArray[indexPath.row])"
//        cell.contentConfiguration = listConfiguration
        return cell
    }
     
    
}

/*
 
есть экран, на котором имеется **UITableView**. Создаем инстанс класса, например:

 ```swift
 ***self.tableViewBuilder = TableViewBuilder(tableView: self.tableView)***
 ```

 Далее создаем и устанавливаем ему секции, которые заполнены, соответственно моделями ячеек. Должна быть возможность настраивать ячейки через closure.

 ***let cellModel = TableViewCellModel(identifier: “customIdentifier”)cellModel.onFill = { ... }***

 Также возможность обработать тап по ячейке – также вызывать соответствующую closure (например onSelect).

 ```swift
 ***cellModel.*onSelect *= { ... }***
 ```

 Пример секции:

 ```swift
 ***let sectionModel = TableViewSectionModel(cells: [cellModel])
 sectionModel.header = TableViewHeaderModel(...)
 self.tableViewBuilder.sections = [sectionModel]**
  // в этот момент можно вызвать например **reloadData**.*
 ```

 Т.е. пусть таблица обновляет представление тогда, когда мы переустанавливаем модели секций. Создать какой-нибудь тестовый экран с разными ячейками и любым наполнением, используя декларативный подход и наш новый класс. При выполнении задания нужно построить работу с помощью **gitFlow**.
 
 */
