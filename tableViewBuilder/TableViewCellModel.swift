//
//  TableViewCellModel.swift
//  tableViewBuilder
//
//  Created by Alexander Bokhulenkov on 06.11.2024.
//

import UIKit

final class TableViewCellModel {
    
    let identifier: String
    var onFill: ((UITableViewCell) -> Void)?
    var onSelect: (()->Void)?
    
    // MARK: - init
    
    init(identifier: String) {
        self.identifier = identifier
    }
}

// MARK: - Extensions

//extension UITableViewCell {
//    static var reuseIdentifier: String {
//        return String(describing: self)
//    }
//}
