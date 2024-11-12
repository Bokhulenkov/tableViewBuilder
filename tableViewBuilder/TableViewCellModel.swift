//
//  TableViewCellModel.swift
//  tableViewBuilder
//
//  Created by Alexander Bokhulenkov on 06.11.2024.
//

import UIKit

final class TableViewCellModel: UITableViewCell {
    
    
        
    // MARK: - init
    
    
        
    
    // MARK: - Methods
    
    func configureCell(_: ()->Void) {
        
    }
}

// MARK: - Extensions

extension UITableViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
