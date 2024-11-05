//
//  TableViewBuilder.swift
//  tableViewBuilder
//
//  Created by Alexander Bokhulenkov on 05.11.2024.
//

import UIKit

final class TableViewBuilder: NSObject {
    var tableView = UITableView()
    let sections: [Int] = []
    
    // MARK: - Init
    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
    }
    
    
}

// MARK: - Extensions

extension TableViewBuilder: UITableViewDelegate {
    
}

extension TableViewBuilder: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        return UITableViewCell()
    }
    
    
}

/*
 
 Реализовать класс, который позволяет конструировать таблицу из кода в декларативном стиле.**Пример использования**: есть экран, на котором имеется **UITableView**. Создаем инстанс класса, например:

 ```swift
 ***self.tableViewBuilder = TableViewBuilder(tableView: self.tableView)***
 ```

 Далее создаем и устанавливаем ему секции, которые заполнены, соответственно моделями ячеек. Должна быть возможность настраивать ячейки через closure.

 ***let cellModel = TableViewCellModel(identifier: “customIdentifier”)cellModel.onFill = { ... }***

 Также возможность обработать тап по ячейке – также вызывать соответствующую closure (например onSelect).
 
 */
