//
//  TableViewBuilder.swift
//  tableViewBuilder
//
//  Created by Alexander Bokhulenkov on 05.11.2024.
//

import UIKit

final class TableViewBuilder: NSObject {
    
    var tableView = UITableView()
    var closures: ()->Void
    let sections: [Int] = []
    
    
    let simpleNumberArray: [Int] = {
        var array = [Int]()
        for _ in 1...25 {
            let numbers = 5...100
            array.append(numbers.randomElement()!)
        }
        return array
    }()
    
    
    // MARK: - Init
    init(tableView: UITableView, closures: @escaping ()->Void) {
        self.tableView = tableView
        self.closures = closures
        super.init()
        setDelegate()
        
        tableView.register(TableViewCellModel.self, forCellReuseIdentifier: UITableViewCell.reuseIdentifier)
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
        simpleNumberArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.reuseIdentifier, for: indexPath) as! TableViewCellModel
        cell.configureCell(closures)
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
